package com.jeongmini.project.user.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import com.jeongmini.project.user.model.User;

public interface UserDAO {
	
	public User selectUser(
			@Param("email") String email,
			@Param("password") String password);

	public int insertUser(
			@Param("name") String name,
			@Param("email") String email,
			@Param("password") String password,
			@Param("petName") String petName
			);
	
	public int countUserName(
			@Param("name") String name);
	
	public int countUserEmail(
			@Param("email") String email);


	public int insertMypet(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("petName") String petName,
			@Param("petBirthday") String petBirthday,
			@Param("petGender") String petGender
			);
	
}
