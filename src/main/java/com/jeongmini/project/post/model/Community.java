package com.jeongmini.project.post.model;

import java.util.Date;
import java.util.List;

import com.jeongmini.project.post.comment.model.Comment;

public class Community {
	private int id;
	private int userId;
	private String userName;
	private String content;
	private String category;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
	
	private List<Comment> commentList;
	private int sympathyTotalCount;
	private boolean existSympathy;
	private int commentTotalCount;
	private String selectCategory;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public int getSympathyTotalCount() {
		return sympathyTotalCount;
	}
	public void setSympathyTotalCount(int sympathyTotalCount) {
		this.sympathyTotalCount = sympathyTotalCount;
	}
	public boolean isExistSympathy() {
		return existSympathy;
	}
	public void setExistSympathy(boolean existSympathy) {
		this.existSympathy = existSympathy;
	}
	public int getCommentTotalCount() {
		return commentTotalCount;
	}
	public void setCommentTotalCount(int commentTotalCount) {
		this.commentTotalCount = commentTotalCount;
	}
	public String getSelectCategory() {
		return selectCategory;
	}
	public void setSelectCategory(String selectCategory) {
		this.selectCategory = selectCategory;
	}

	
}
