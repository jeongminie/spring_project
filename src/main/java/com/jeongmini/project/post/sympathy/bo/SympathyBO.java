package com.jeongmini.project.post.sympathy.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeongmini.project.post.sympathy.dao.SympathyDAO;

@Service
public class SympathyBO {
	@Autowired
	private SympathyDAO sympathyDAO;

	public int addSympathy(int userId, int postId) {
		return sympathyDAO.insertSympathy(userId, postId);
		}
	
	public boolean existSympathy(int userId, int postId) {
		int count = sympathyDAO.selectCountSympathy(userId, postId);
		
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
	}
	
}
