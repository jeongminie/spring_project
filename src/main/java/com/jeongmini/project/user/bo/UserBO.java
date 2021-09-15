package com.jeongmini.project.user.bo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeongmini.project.common.EncryptUtils;
import com.jeongmini.project.user.dao.UserDAO;
import com.jeongmini.project.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public User signIn(String loginEmail, String password) {
		return userDAO.selectUser(loginEmail, password);
		
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

}
