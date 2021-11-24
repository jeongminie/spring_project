package com.jeongmini.project.user.model;

import java.util.Date;
import java.util.List;

public class MyPet {
	
	private int id;
	private int userId;
	private String userName;
	private String petName;
	private String petGender;
	private String petBirthday;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
	private List<MyPet> mypetList;
	
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
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getPetGender() {
		return petGender;
	}
	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}
	public String getPetBirthday() {
		return petBirthday;
	}
	public void setPetBirthday(String petBirthday) {
		this.petBirthday = petBirthday;
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
	public List<MyPet> getMypetList() {
		return mypetList;
	}
	public void setMypetList(List<MyPet> mypetList) {
		this.mypetList = mypetList;
	}
	
	

}
