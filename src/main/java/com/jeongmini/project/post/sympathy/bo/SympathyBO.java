package com.jeongmini.project.post.sympathy.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeongmini.project.post.sympathy.dao.SympathyDAO;

@Service
public class SympathyBO {
	@Autowired
	private SympathyDAO sympathyDAO;
	
	public boolean existSympathy(int userId, int postId) {
		int count = sympathyDAO.selectCountSympathy(userId, postId);
		
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean sympathy(int userId, int postId) {
		if(this.existSympathy(userId, postId)) {
			sympathyDAO.deleteSympathy(userId, postId);		
			return false;
		} else {
			sympathyDAO.insertSympathy(userId, postId);
			return true;
		}
		
	}
	
	public int sympathyCount(int postId) {
		return sympathyDAO.selectCountSympathyByPostId(postId);
	}
	
	public int deletePostSympathy(int postId) {
		return sympathyDAO.deletePostSympathy(postId);
	}
}
