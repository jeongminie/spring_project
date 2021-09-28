package com.jeongmini.project.post.model;

import java.util.List;

import com.jeongmini.project.post.comment.model.Comment;

public class PostWithComments {

	private Community community;
	private List<Comment> commentList;
	private int commentTotalCount;
	private boolean existSympathy;
	
	public Community getCommunity() {
		return community;
	}
	public void setCommunity(Community community) {
		this.community = community;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public int getCommentTotalCount() {
		return commentTotalCount;
	}
	public void setCommentTotalCount(int commentTotalCount) {
		this.commentTotalCount = commentTotalCount;
	}
	public boolean isExistSympathy() {
		return existSympathy;
	}
	public void setExistSympathy(boolean existSympathy) {
		this.existSympathy = existSympathy;
	}

	
	
}
