package com.dog.save.dog.store.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;
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



}
