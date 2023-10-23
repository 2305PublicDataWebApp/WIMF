package com.dog.save.dog.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.common.domain.PageInfo;
import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
import com.dog.save.dog.domain.DogLike;
import com.dog.save.dog.domain.DogReply;
import com.dog.save.dog.store.DogStore;

@Repository
public class DogStoreLogic implements DogStore{

	@Override
	public int insertDog(SqlSession session, Dog dog) {
		int result = session.insert("DogMapper.insertDog", dog);
		return result;
	}

	@Override
	public int selectDogNoSeq(SqlSession session) {
		int result = session.selectOne("DogMapper.selectDogNoSeq");
		return result;
	}

	@Override
	public int insertDogFiles(SqlSession session, DogFile dogFile) {
		int result = session.insert("DogMapper.insertDogFiles", dogFile);
		return result;
	}

	@Override
	public int getListCount(SqlSession session) {
		int result = session.selectOne("DogMapper.getListCount");
		return result;
	}

	@Override
	public List<Dog> selectAllDog(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Dog> dogList = session.selectList("DogMapper.selectAllDog", null, rowBounds);
		return dogList;		
	}

	@Override
	public List<DogFile> selectFirstDogFile(SqlSession session) {
		List<DogFile> dogFileList = session.selectList("DogMapper.selectFirstDogFile");
		return dogFileList;
	}

	@Override
	public Dog selectDogByDogNo(SqlSession session, int dogNo) {
		Dog dog = session.selectOne("DogMapper.selectDogByDogNo", dogNo);
		return dog;
	}

	@Override
	public List<DogFile> selectDogFileByDogNo(SqlSession session, int dogNo) {
		List<DogFile> dogFileList = session.selectList("DogMapper.selectDogFileByDogNo", dogNo);
		return dogFileList;
	}

	@Override
	public List<Dog> selectDogsByRegion(SqlSession session, String region, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Dog> dogList = session.selectList("DogMapper.selectDogsByRegion", region, rowBounds);
		return dogList;	
	}

	@Override
	public int getListCountByRegion(SqlSession session, String region) {
		int result = session.selectOne("DogMapper.getListCountByRegion",region);
		return result;
	}

	@Override
	public int getListCountBySearch(SqlSession session, String searchInput) {
		int result = session.selectOne("DogMapper.getListCountBySearch", searchInput);
		return result;
	}

	@Override
	public List<Dog> selectDogsBySearch(SqlSession session, String searchInput, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Dog> dogList = session.selectList("DogMapper.selectDogsBySearch", searchInput, rowBounds);
		return dogList;	
	}

	@Override
	public int insertReply(SqlSession session, DogReply dogReply) {
		int result = session.insert("DogMapper.insertReply", dogReply);
		return result;
	}

	@Override
	public List<DogReply> selectReplyList(SqlSession session, Integer dogNo) {
		List<DogReply> dogRList = session.selectList("DogMapper.selectReplyList", dogNo);
		return dogRList;
	}

	@Override
	public int updateReply(SqlSession session, DogReply dogReply) {
		int result = session.update("DogMapper.updateReply", dogReply);
		return result;
	}

	@Override
	public int deleteReply(SqlSession session, Integer dogReplyNo) {
		int result = session.delete("DogMapper.deleteReply", dogReplyNo);
		return result;
	}

	@Override
	public int modifyDog(SqlSession session, Dog dog) {
		int result = session.update("DogMapper.modifyDog", dog);
		return result;
	}

	@Override
	public int deleteDogFileByDogNoAndOrder(SqlSession session, int refDogNo, int dogFileOrder) {
		DogFile dogFile = new DogFile(refDogNo,dogFileOrder);
		int result = session.delete("DogMapper.deleteDogFileByDogNoAndOrder", dogFile);
		return result;
	}

	@Override
	public int deleteDogFileByFilePath(SqlSession session, String toDeleteFilePath) {
		int result = session.delete("DogMapper.deleteDogFileByFilePath", toDeleteFilePath);
		return result;
	}

	@Override
	public int deleteDog(SqlSession session, int dogNo) {
		int result = session.delete("DogMapper.deleteDog", dogNo);
		return result;
	}

	@Override
	public int insertLikeStatus(SqlSession session, DogLike dogLike) {
		int result = session.insert("DogMapper.insertLikeStatus", dogLike);
		return result;
	}

	@Override
	public String getLikeStatus(SqlSession session, DogLike dogLike) {
		String result = session.selectOne("DogMapper.getLikeStatus", dogLike);
		return result;
	}

	@Override
	public int updateLikeStatus(SqlSession session, DogLike dogLike) {
		int result = session.update("DogMapper.updateLikeStatus", dogLike);
		return result;
	}


//	기진 코드
	@Override
	public List<Dog> selectAllDogList(SqlSession session) {
		List<Dog> dogList = session.selectList("DogMapper.selectAllDogList");
		return dogList;
	}
	
	@Override
	public List<Dog> selectCareList(SqlSession session) {
		List<Dog> careList = session.selectList("DogMapper.selectCareList");
		return careList;
	}

	@Override
	public List<Dog> selectAdoptList(SqlSession session) {
		List<Dog> adoptList = session.selectList("DogMapper.selectAdoptList");
		return adoptList;
	}
//	기진 코드

	// 솔 코드 for Map
	@Override
	public List<Dog> selectAllDogListMap(SqlSession session) {
		List<Dog> dogList = session.selectList("DogMapper.selectAllDog");
		return dogList;
	}

	
	// 이승현 왔다감
	// 마이페이지 좋아요 누른 강아지 리스트
	@Override
	public List<DogLike> selectLikeDogList(SqlSession session, String userId) {
		List<DogLike> dlList = session.selectList("DogMapper.selectLikeDogList", userId);
		return dlList;
	}

	@Override
	public List<Dog> selectDogsByEuthanasiaAndRegion(SqlSession session, String region, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Dog> dogList = session.selectList("DogMapper.selectDogsByEuthanasiaAndRegion", region, rowBounds);
		return dogList;			
	}

	@Override
	public List<Dog> selectDogsByEuthanasia(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Dog> dogList = session.selectList("DogMapper.selectDogsByEuthanasia", null, rowBounds);
		return dogList;		
	}

	


}
