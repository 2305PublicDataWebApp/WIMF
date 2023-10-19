package com.dog.save.dog.service.impl;

import java.io.File;
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
	public int modifyDog(Dog dog, MultipartFile[] uploadFiles, String[] originalName, HttpServletRequest request) {
	    int result = 0;
	    try {
	        result = dStore.modifyDog(session, dog);
	        if (result > 0) {
	            int dogNo = dog.getDogNo();
	            List<DogFile> existingFiles = dStore.selectDogFileByDogNo(session, dogNo);
	            Set<String> usedFileRenameSet = new HashSet<>();
	            Set<String> toDeleteFilePathSet = new HashSet<>();	            	            
	            for (int i = 0; i < uploadFiles.length; i++) {
	                MultipartFile uploadFile = uploadFiles[i];
	                String checkDogFile = originalName[i];

	                if (uploadFile != null && !uploadFile.isEmpty()) {
	                    // 파일이 업로드되었을 때
	                    Map<String, Object> dogFileMap = this.saveFile(request, uploadFile);
	                    String dogFileName = (String) dogFileMap.get("dogFileName");
	                    String dogFileRename = (String) dogFileMap.get("dogFileRename");
	                    String dogFilePath = (String) dogFileMap.get("dogFilePath");
	                    int dogFileOrder = -1;

	                    // 수정된 파일 중에서 이미 사용 중인 파일 이름을 찾음
	                    for (DogFile existingFile : existingFiles) {
	                    	// 전체 목록과 수정안할 파일 이름과 같으면
	                        if (existingFile.getDogFileRename().equals(checkDogFile)) {
	                        	// 파일순서는 원래 순서로 저장
	                            dogFileOrder = existingFile.getDogFileOrder();
	                            // 바꾸지않을 파일 리네임을 usedFileRenameSet에 저장
	                            usedFileRenameSet.add(checkDogFile); 	                            
	                            break;
	                        }
	                    }
	                    
	                    if (dogFileOrder == -1) {
	                        // 수정된 파일이므로 순서를 찾음
	                        dogFileOrder = findEmptyDogFileOrder(existingFiles, usedFileRenameSet);
	                    }
	                    DogFile dogFile = new DogFile(dogNo, dogFileOrder, dogFileName, dogFileRename, dogFilePath);
	                    // 데이터베이스에 파일 추가
	                    dStore.insertDogFiles(session, dogFile);
	                } 	                
	            }
	         // 수정되지 않은 파일들을 찾아 삭제할 파일 경로를 집합에 추가합니다.
	            for (DogFile existingFile : existingFiles) {
	                if (!usedFileRenameSet.contains(existingFile.getDogFileRename())) {
	                    String toDeleteFilePath = existingFile.getDogFilePath();
	                    toDeleteFilePathSet.add(toDeleteFilePath);
	                }
	            }
	            // toDeleteFilePathSet에 있는 파일들을 파일 시스템에서 삭제하고 데이터베이스에서 삭제할 수 있습니다.
	            for (String toDeleteFilePath : toDeleteFilePathSet) {
	                // 파일 시스템에서 파일 삭제 (이 부분을 파일 시스템에 따라 변경해야 할 수 있습니다)
	                File fileToDelete = new File(toDeleteFilePath);
	                if (fileToDelete.exists()) {
	                    fileToDelete.delete();
	                }

	                // 데이터베이스에서 해당 파일 삭제 (파일 경로 또는 파일 ID를 사용하여 삭제)
	                dStore.deleteDogFileByFilePath(session, toDeleteFilePath);
	            }	            
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        result = -1;
	    }
	    return result;
	}

	private int findEmptyDogFileOrder(List<DogFile> existingFiles, Set<String> usedFileRenameSet) {
	    // 사용 중인 dogFileOrder 값을 저장하는 집합 생성
	    Set<Integer> usedOrderSet = new HashSet<>();
	    
	    // 기존 dogFileOrder 값을 집합에 추가
	    for (DogFile existingFile : existingFiles) {
	        if (usedFileRenameSet.contains(existingFile.getDogFileRename())) {
	            usedOrderSet.add(existingFile.getDogFileOrder());
	        }
	    }

	    // 사용 중이지 않은 순서를 찾아 반환
	    for (int i = 1; i <= 3; i++) {
	        if (!usedOrderSet.contains(i)) {
	            return i;
	        }
	    }
	    
	    // 모든 순서가 사용 중인 경우, 100을 반환
	    return 100;
	}


	

}
