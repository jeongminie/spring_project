package com.jeongmini.project.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jeongmini.project.common.FileManagerService;
import com.jeongmini.project.post.comment.bo.CommentBO;
import com.jeongmini.project.post.comment.model.Comment;
import com.jeongmini.project.post.dao.PostDAO;
import com.jeongmini.project.post.model.Community;
import com.jeongmini.project.post.model.Daily;
import com.jeongmini.project.post.model.PostWithComments;
import com.jeongmini.project.post.sympathy.bo.SympathyBO;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private SympathyBO sympathyBO;
	
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
	
	public List<PostWithComments> getCommunityList(int userId) {
		List<Community> communityList = postDAO.selectCommunityList();
		
		List<PostWithComments> postWithCommentsList = new ArrayList<>();
		
		for(Community community:communityList) {
			List<Comment> commentList = commentBO.getCommentList(community.getId());
			int commentTotalCount = commentBO.getCommentTotalCount(community.getId());
			boolean existSympathy = sympathyBO.existSympathy(userId, community.getId());
			
			PostWithComments postWithComments = new PostWithComments();
			postWithComments.setCommunity(community);
			postWithComments.setCommentList(commentList);
			postWithComments.setCommentTotalCount(commentTotalCount);
			postWithComments.setExistSympathy(existSympathy);
			
			postWithCommentsList.add(postWithComments);
			
		}	
		return postWithCommentsList; 	
	}
	
	public Community getCommunity(int id) {
		
		Community community = postDAO.selectCommunity(id);
		List<Comment> commentList = commentBO.getCommentList(community.getId());
		
		community.setCommentList(commentList);
		
		return community;
	}
	
	public List<Daily> getDaily(int userId) {
		return postDAO.selectDaily(userId);
	}
	
	
}
