package com.jeongmini.project.user.bo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jeongmini.project.common.EncryptUtils;
import com.jeongmini.project.common.FileManagerService;
import com.jeongmini.project.user.dao.UserDAO;
import com.jeongmini.project.user.model.MyPet;
import com.jeongmini.project.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public User signIn(String loginEmail, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.selectUser(loginEmail, encryptPassword);
		
	}
	
	public int signUp(String name, String email, String password, String petName) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		if(encryptPassword.equals("")) {
			logger.error("[UserBO signUP]암호화 실패");
			return 0;
		}
		
		return userDAO.insertUser(name, email, encryptPassword, petName);
	}
	
	public boolean existUserName(String name) {
		if(userDAO.countUserName(name) == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean existUserEmail(String email) {
		if(userDAO.countUserEmail(email) == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public int myPet(int userId, String userName, String petName, String petBirthday, String petgGender, MultipartFile file) {

		FileManagerService fileManager = new FileManagerService();
		
		String filePath = fileManager.saveProfile(userId, file);
		
		if(filePath == null) {
			return -1;
		}
		
		
		return userDAO.insertMypet(userId, userName, petName, petBirthday, petgGender, filePath);
		
	}
	
	public MyPet getMyPet(int userId) {
		return userDAO.selectMyPet(userId);
		
	}
	
	public int userUpdate(int id, String name, String password ) {
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.UserUpdate(id, name, encryptPassword);
	}
	
	

}
