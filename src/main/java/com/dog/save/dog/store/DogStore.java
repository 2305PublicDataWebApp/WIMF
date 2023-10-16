package com.dog.save.dog.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dog.save.dog.domain.Dog;
import com.dog.save.dog.domain.DogFile;

public interface DogStore {

	/**
	 * 돌봄 강아지 정보 등록 Store
	 * @param session
	 * @param dog
	 * @return
	 */
	int insertDog(SqlSession session, Dog dog);

	/**
	 * 돌봄 강아지 연관번호 조회 Store
	 * @param session
	 * @return
	 */
	int selectDogNoSeq(SqlSession session);


	int insertDogFiles(SqlSession session, DogFile dogFile);



}
