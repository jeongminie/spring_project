package com.jeongmini.project.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeongmini.project.post.comment.dao.CommentDAO;
import com.jeongmini.project.post.comment.model.Comment;

@Service
public class CommentBO {
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int userId, String userName, int postId, String comment) {
		return commentDAO.insertComment(userId, userName, postId, comment);
	}
	
	public List<Comment> getCommentList(int postId) {
		return commentDAO.selectCommentList(postId);
	}

	public int getCommentTotalCount(int postId) {
		return commentDAO.selectCommentTotalCount(postId);
	}
}
