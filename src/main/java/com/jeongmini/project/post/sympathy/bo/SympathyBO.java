package com.jeongmini.project.post.sympathy.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeongmini.project.post.sympathy.dao.SympathyDAO;
import com.jeongmini.project.post.sympathy.model.Sympathy;

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
	
	public List<Sympathy> selectsympathyUserId(int postId) {
		return sympathyDAO.selectSympathyUserId(postId);
	}
	
	public int deletePostSympathy(int postId) {
		return sympathyDAO.deletePostSympathy(postId);
	}
}
