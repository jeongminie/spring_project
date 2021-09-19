package com.jeongmini.project.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jeongmini.project.common.FileManagerService;
import com.jeongmini.project.post.dao.PostDAO;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String userName, String content, String category, MultipartFile file) {
		
		FileManagerService fileManager = new FileManagerService();
		fileManager.saveFile(userId, file);
		
		String filePath = fileManager.saveFile(userId, file); 
		
		if(filePath == null) {
			return -1;
		}
		
		return postDAO.insertPost(userId, userName, content, category, filePath);
		
	}
	
	public int addPostDaily(int userId, String userName, String content, String condition, String health, String defecation) {
		return postDAO.insertPostDaily(userId, userName, content, condition, health, defecation);
		
	}
}
