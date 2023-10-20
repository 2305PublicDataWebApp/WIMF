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
			result = dStore.insertDog(session, dog);
			if(result>0) {
				int refDogNo = dStore.selectDogNoSeq(session);
				int dogFileOrder = 1;
				for(MultipartFile uploadFile : uploadFiles) {
					if(uploadFile != null && !uploadFile.isEmpty()) {
						//파일저장 메소드 호출
						Map<String, Object> dogFileMap = this.saveFile(request,uploadFile);
						String dogFileName = (String)dogFileMap.get("dogFileName");
						String dogFileRename = (String)dogFileMap.get("dogFileRename");
						String dogFilePath = (String)dogFileMap.get("dogFilePath");
						DogFile dogFile = new DogFile(refDogNo, dogFileOrder, dogFileName, dogFileRename, dogFilePath);
						dStore.insertDogFiles(session, dogFile);	
						dogFileOrder++;
					}
				}				
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		return result;
	}
	@Override
	public Integer getListCount() {
		int result = dStore.getListCount(session);
		return result;
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
	//랜덤키 생성 메소드
	private String getRandomString() {
	    String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    StringBuilder randomString = new StringBuilder();
	    int length = 5; // 원하는 길이로 변경
	    Random random = new Random();
	    for (int i = 0; i < length; i++) {
	        randomString.append(characters.charAt(random.nextInt(characters.length())));
	    }
	    return randomString.toString();
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
//	기진 코드
	@Override
	public List<Dog> selectAllDogList() {
		List<Dog> dogList = dStore.selectAllDogList(session);
		return dogList;
	}	
//	기진 코드
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
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int modifyDog(Dog dog, MultipartFile[] uploadFiles, List<Integer> noChangeFileOrder, HttpServletRequest request) {
		int result = dStore.modifyDog(session, dog);
		if(result>0) {
			int dogNo = dog.getDogNo();			
			List<DogFile> newFiles = new ArrayList<>();
			List<Integer> availableFileOrders = new ArrayList<>(Arrays.asList(1, 2, 3));
			Set<String> toDeleteSet = new HashSet<>();
			List<DogFile> oldFileList = dStore.selectDogFileByDogNo(session, dogNo);
			// 기존 파일의 순서를 확인하고 사용 중인 순서를 제외한 순서를 선택			
			if (noChangeFileOrder == null) {
			    availableFileOrders = new ArrayList<>(Arrays.asList(1, 2, 3));
			} else {
			    for (Integer order : noChangeFileOrder) {
			        availableFileOrders.remove(order);
			    }
			} 			
			// 2. 기존 파일 삭제
			for (DogFile oldFile : oldFileList) {
			    // 파일 경로를 toDeleteSet에 추가
			    if (noChangeFileOrder == null || !noChangeFileOrder.contains(oldFile.getDogFileOrder())) {
			        toDeleteSet.add(oldFile.getDogFilePath());
			    }
			}
			// 1. 새 파일 업로드
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
			// 3. 기존 파일 삭제 및 새 파일 등록
			for (String filePath : toDeleteSet) {			
				this.deleteFile(filePath);
				dStore.deleteDogFileByFilePath(session, filePath);
			}
			
			// 3. 새 파일 등록 및 기존 파일 삭제
			for (DogFile newFile : newFiles) {
				// 새 파일 등록
				dStore.insertDogFiles(session, newFile);            
			}	
		}
		return result;
    }

    public void deleteFile(String filePath) {   	
    	try {
    		String[] pathParts = filePath.split("/");    		
    		String fileName = pathParts[pathParts.length - 1];    		
    		String basePath = "src/main/webapp/resources/dogUploadFiles/";    		
    		String fullPath = basePath + fileName;    		
			String absolutePath = new File(fullPath).getCanonicalPath();			
			File file = new File(absolutePath);
			if (file.exists()) {
			    file.delete();
			    System.out.println("파일 삭제: " + absolutePath);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
      
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


	

}
