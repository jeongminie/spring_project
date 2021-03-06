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
import com.jeongmini.project.post.sympathy.model.Sympathy;

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
		
		String filePath = fileManager.saveFile(userId, file); 
		
		if(filePath == null) {
			return -1;
		}
		
		return postDAO.insertPost(userId, userName, content, category, filePath);
		
	}
	
	public int addPostDaily(int userId, String userName, String content, String condition, String health, String defecation, boolean walk, boolean medicine, String imageurl) {
		return postDAO.insertPostDaily(userId, userName, content, condition, health, defecation, walk, medicine, imageurl);
		
	}
	
	public List<PostWithComments> getCommunityList(int userId) {
		List<Community> communityList = postDAO.selectCommunityList();
		
		List<PostWithComments> postWithCommentsList = new ArrayList<>();
		
		for(Community community:communityList) {
			List<Comment> commentList = commentBO.getCommentList(community.getId());
			int commentTotalCount = commentBO.getCommentTotalCount(community.getId());
			boolean existSympathy = sympathyBO.existSympathy(userId, community.getId());
			int sympathyTotalCount = sympathyBO.sympathyCount(community.getId());
			List<Sympathy> sympathy = sympathyBO.selectsympathyUserId(community.getId());
			
			PostWithComments postWithComments = new PostWithComments();
			postWithComments.setCommunity(community);
			postWithComments.setCommentList(commentList);
			postWithComments.setCommentTotalCount(commentTotalCount);
			postWithComments.setExistSympathy(existSympathy);
			postWithComments.setSympathyTotalCount(sympathyTotalCount);
			postWithComments.setSympathy(sympathy);
			
			postWithCommentsList.add(postWithComments);
			
		}	
		return postWithCommentsList; 	
	}
	
	public Community getCommunity(int id) {
		
		Community community = postDAO.selectCommunity(id);
		List<Comment> commentList = commentBO.getCommentList(community.getId());
		boolean existSympathy = sympathyBO.existSympathy(community.getUserId(), community.getId());
		int sympathyTotalCount = sympathyBO.sympathyCount(community.getId());
		List<Sympathy> sympathy = sympathyBO.selectsympathyUserId(community.getId());
		
		community.setCommentList(commentList);
		community.setSympathyTotalCount(sympathyTotalCount);
		community.setExistSympathy(existSympathy);
		community.setSympathy(sympathy);
		
		return community;
	}
	
	public Daily getDaily(int id, int userId) {
		return postDAO.selectDaily(id, userId);
	}
	
	public int updatePost(int postId, String content, String category) {
		return postDAO.updatePost(postId, content, category);
	}
	
	public List<Daily> getDailyList(int userId){
		return postDAO.selectDailyList(userId);
	};
	
	public boolean deletePost(int postId, int userId) {
		Community community = postDAO.selectCommunity(postId);
		int count = postDAO.deletePost(postId, userId);
		
		if(count != 1) {
			return false;
		}
		
		FileManagerService fileManagerService = new FileManagerService();
		fileManagerService.removeFile(community.getImagePath());
		
		commentBO.deletePostComment(postId);
		sympathyBO.deletePostSympathy(postId);
		
		return true;
		
		
	}
	
	public	Community getCommunityCategoryList(String category) {
		return postDAO.selectCommunityCategoryList(category);
	}
	
	public	Community getCommunityCategory(String category) {
		return postDAO.selectCommunityCategory(category);
	}
}
