package com.dog.save.dog.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.dog.save.common.domain.PageInfo;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogLike;
import com.dog.save.dog.domain.DogReply;
import com.dog.save.dog.service.DogService;
import com.dog.save.dog.store.DogStore;
import com.dog.save.user.domain.UserDog;

@Service
public class DogServiceImpl implements DogService{

	@Autowired
	private SqlSession session;
	
	@Autowired
	private DogStore dStore;
	
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertDog(Dog dog, MultipartFile[] uploadFiles, HttpServletRequest request) {
		int result = 0;
		try {
			result = dStore.insertDog(session, dog); // 강아지 정보 먼저 등록
			if(result>0) {
				int refDogNo = dStore.selectDogNoSeq(session); // 생성된 dogNo 조회 후 refDogNo에 저장
				int dogFileOrder = 1;
				for(MultipartFile uploadFile : uploadFiles) {
					if(uploadFile != null && !uploadFile.isEmpty()) {
						//파일저장 메소드 호출
						Map<String, Object> dogFileMap = this.saveFile(request,uploadFile); // dogFile 저장 Map 생성
						String dogFileName = (String)dogFileMap.get("dogFileName");
						String dogFileRename = (String)dogFileMap.get("dogFileRename");
						String dogFilePath = (String)dogFileMap.get("dogFilePath");
						DogFile dogFile = new DogFile(refDogNo, dogFileOrder, dogFileName, dogFileRename, dogFilePath);
						dStore.insertDogFiles(session, dogFile); // 파일정보 set 끝난 dogFile 보내서 등록	
						dogFileOrder++; // 파일 하나 등록 후 파일순서 하나씩 증가
					}
				}				
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		return result;
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int modifyDog(Dog dog, MultipartFile[] uploadFiles, List<Integer> noChangeFileOrder, HttpServletRequest request) {
		int result = dStore.modifyDog(session, dog); // 강아지 정보 수정 먼저 진행
		if(result>0) {
			int dogNo = dog.getDogNo();			
			List<DogFile> newFiles = new ArrayList<>(); // 새로운 파일 저장 리스트 생성
			List<Integer> availableFileOrders = new ArrayList<>(Arrays.asList(1, 2, 3)); // 사용 가능한 파일 순서 리스트에 저장, 초기값 [1,2,3]
			Set<String> toDeleteSet = new HashSet<>(); // 삭제할 파일 경로 저장할 Set 생성
			List<DogFile> oldFileList = dStore.selectDogFileByDogNo(session, dogNo); // 수정 전 파일 강아지 번호로 조회 후 리스트에 저장
			// 기존 파일의 순서를 확인하고 사용 중인 순서를 제외한 순서를 선택			
			if (noChangeFileOrder == null) {
			    availableFileOrders = new ArrayList<>(Arrays.asList(1, 2, 3)); // 수정하지 않는 파일이 없을 때 [1,2,3] 사용
			} else {
			    for (Integer order : noChangeFileOrder) { // 수정하지 않을 파일순서 조회하면서 사용가능한 파일순서에서 제외
			        availableFileOrders.remove(order);
			    }
			} 			
			// 기존 파일 삭제
			for (DogFile oldFile : oldFileList) {
			    // 파일 경로를 toDeleteSet에 추가
			    if (noChangeFileOrder == null || !noChangeFileOrder.contains(oldFile.getDogFileOrder())) { // 모두 변경하거나 수정하지않을 파일순서가 아니면 
			        toDeleteSet.add(oldFile.getDogFilePath()); // 해당 파일순서의 수정 전 파일 toDeleteSet에 등록
			    }
			}
			// 새 파일 업로드
			for (int i = 0; i < uploadFiles.length; i++) {
				// 업로드할 파일이 존재하는 경우만 처리
				if (!uploadFiles[i].isEmpty()) {
					try {
						Map<String, Object> fileMap = saveFile(request, uploadFiles[i]);
						DogFile newFile = new DogFile();
						newFile.setRefDogNo(dogNo);
						newFile.setDogFileName(fileMap.get("dogFileName").toString());
						newFile.setDogFileRename(fileMap.get("dogFileRename").toString());
						newFile.setDogFilePath(fileMap.get("dogFilePath").toString());						
						// 사용 가능한 순서 중 첫 번째 순서를 선택
						if (!availableFileOrders.isEmpty()) {
							int newFileOrder = availableFileOrders.get(0);
							newFile.setDogFileOrder(newFileOrder); // 새 파일의 순서 설정
							availableFileOrders.remove(0); // 사용한 순서를 제거
						} else {
							throw new Exception("모든 파일 순서가 사용 중입니다.");
						}
						newFiles.add(newFile);
						
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
				}
			}			
			// 기존 파일 삭제 및 새 파일 등록
			for (String filePath : toDeleteSet) { // toDeleteSet에서 파일경로 꺼내서 delteFile메소드 이용해서 파일 디렉토리에서 삭제 및 DB에서 삭제			
				this.deleteFile(filePath);
				dStore.deleteDogFileByFilePath(session, filePath);
			}			
			// 새 파일 등록 및 기존 파일 삭제
			for (DogFile newFile : newFiles) {
				// 새 파일 등록
				dStore.insertDogFiles(session, newFile);            
			}	
		}
		return result;
	}
	@Override
	public Integer getListCount() {
		int result = dStore.getListCount(session);
		return result;
	}
	@Override
	public List<Dog> selectAllDog(PageInfo pInfo) {
		List<Dog> dogList = dStore.selectAllDog(session,pInfo);
		return dogList;
	}
	@Override
	public List<DogFile> selectFirstDogFile() {
		List<DogFile> dogFileList = dStore.selectFirstDogFile(session);
		return dogFileList;
	}
	@Override
	public Dog selectDogByDogNo(int dogNo) {
		Dog dog = dStore.selectDogByDogNo(session,dogNo);
		return dog;
	}
	@Override
	public List<DogFile> selectDogFileByDogNo(int dogNo) {
		List<DogFile> dogFileList = dStore.selectDogFileByDogNo(session,dogNo);
		return dogFileList;
	}
	@Override
	public List<Dog> selectDogsByRegion(String region, PageInfo pInfo) {
		List<Dog> dogList = dStore.selectDogsByRegion(session,region,pInfo);
		return dogList;
	}
	@Override
	public Integer getListCountByRegion(String region) {
		int result = dStore.getListCountByRegion(session,region);
		return result;
	}
	@Override
	public Integer getListCountBySearch(String searchInput) {
		int result = dStore.getListCountBySearch(session,searchInput);
		return result;
	}
	@Override
	public List<Dog> selectDogsBySearch(String searchInput, PageInfo pInfo) {
		List<Dog> dogList = dStore.selectDogsBySearch(session,searchInput,pInfo);
		return dogList;
	}
	@Override
	public int insertReply(DogReply dogReply) {
		int result = dStore.insertReply(session,dogReply);
		return result;
	}
	@Override
	public List<DogReply> selectReplyList(Integer dogNo) {
		List<DogReply> dogRList = dStore.selectReplyList(session,dogNo);
		return dogRList;
	}
	@Override
	public int updateReply(DogReply dogReply) {
		int result = dStore.updateReply(session,dogReply);
		return result;
	}
	@Override
	public int deleteReply(Integer dogReplyNo) {
		int result = dStore.deleteReply(session,dogReplyNo);
		return result;
	}
	
	@Override
	public int deleteDog(int dogNo) {
		int result = dStore.deleteDog(session,dogNo);
		return result;
	}
	@Override
	public int insertLikeStatus(DogLike dogLike) {
		int result = dStore.insertLikeStatus(session,dogLike);
		return result;
	}
	@Override
	public String getLikeStatus(DogLike dogLike) {
		String result = dStore.getLikeStatus(session,dogLike);
		return result;
	}
	@Override
	public int updateLikeStatus(DogLike dogLike) {
		int result = dStore.updateLikeStatus(session,dogLike);
		return result;
	}

	@Override
	public List<Dog> selectAllDogList() {
		List<Dog> dogList = dStore.selectAllDogList(session);
		return dogList;
	}	
	@Override
	public List<Dog> selectCareList() {
		List<Dog> careList = dStore.selectCareList(session);
		return careList;
	}
	@Override
	public List<Dog> selectAdoptList() {
		List<Dog> adoptList = dStore.selectAdoptList(session);
		return adoptList;
	}
	
	// 이승현 왔다감
	// 마이페이지 좋아요 누른 강아지 리스트
	@Override
	public List<UserDog> selectLikeDogList(String userId) {
		List<UserDog> dlList = dStore.selectLikeDogList(session, userId);
		return dlList;
	}
	
	// 파일저장 메소드
	public Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception{
		Map<String, Object> fileMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("/resources");
		// 파일 저장 경로 구하기
		String savePath = root + "\\dogUploadFiles";
		// 파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		// 파일 확장자 구하기
		String extension = fileName.substring(fileName.lastIndexOf(".")+1);
		// 시간으로 파일 리네임하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis()))+ getRandomString()+"."+extension;
		// 파일 저장 전 폴더 만들기
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
			System.out.println("폴더가 존재하지 않아 생성됨");
		}
		// 파일 저장
		File saveFile = new File(savePath+"\\"+fileRename);
		uploadFile.transferTo(saveFile);
		// 파일 정보 리턴
		fileMap.put("dogFileName", fileName);
		fileMap.put("dogFileRename", fileRename);
		fileMap.put("dogFilePath", "../resources/dogUploadFiles/"+fileRename);
		return fileMap;
	}

	// 파일 삭제 메소드
	public void deleteFile(String filePath) {   	
		try {
			String[] pathParts = filePath.split("/"); // 파일경로 / 기준으로 자르고 배열에 저장    		
			String fileName = pathParts[pathParts.length - 1]; // 마지막 인덱스(파일리네임부분)를 fileName에 저장    		
			String basePath = "src/main/webapp/resources/dogUploadFiles/"; // 파일 저장소 위치    		
			String fullPath = basePath + fileName; // 전체 경로     		
			String absolutePath = new File(fullPath).getCanonicalPath(); // 절대경로 만들기			
			File file = new File(absolutePath);
			if (file.exists()) { // 파일 존재하면 파일 디렉토리에서 삭제
			    file.delete();
			    System.out.println("파일 삭제: " + absolutePath);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
	}
	//랜덤키 생성 메소드
	private String getRandomString() {
	    String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    StringBuilder randomString = new StringBuilder();
	    int length = 5; // 원하는 길이로 변경
	    Random random = new Random();
	    for (int i = 0; i < length; i++) {
	        randomString.append(characters.charAt(random.nextInt(characters.length()))); //랜덤 숫자 추가
	    }
	    return randomString.toString();
	}

	// 솔 코드 for Map
	@Override
	public List<Dog> selectAllDogListMap() {
		List<Dog> dogList = dStore.selectAllDogListMap(session);
		return dogList;
	}

	@Override
	public List<Dog> selectDogsByEuthanasiaAndRegion(String region, PageInfo pInfo) {
		List<Dog> dogList = dStore.selectDogsByEuthanasiaAndRegion(session,region,pInfo);
		return dogList;
	}

	@Override
	public List<Dog> selectDogsByEuthanasia(PageInfo pInfo) {
		List<Dog> dogList = dStore.selectDogsByEuthanasia(session,pInfo);
		return dogList;
	}
	// 기진 코드
	@Override
	public List<Dog> selectNoneList() {
		List<Dog> noneList = dStore.selectNoneList(session);
		return noneList;
	}
	// 기진 코드

	@Override
	public int getTotalDonationByDogNo(int dogNo) {
		int result = dStore.getTotalDonationByDogNo(session,dogNo);
		return result;
	}
	
	
	

}
