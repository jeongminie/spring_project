package com.jeongmini.project.post.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jeongmini.project.post.model.Community;
import com.jeongmini.project.post.model.Daily;

@Repository
public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("content") String content,
			@Param("category") String category,
			@Param("imagePath") String imagePath
			);
	
	public int insertPostDaily(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("content") String content,
			@Param("condition") String condition,
			@Param("health") String health,
			@Param("defecation") String defecation,
			@Param("walk") boolean walk,
			@Param("medicine") boolean medicine,
			@Param("imageurl") String imageurl
			);
	
	public List<Community> selectCommunityList();
	
	public Community selectCommunity(@Param("id") int id);
	
	public List<Daily> selectDailyList(@Param("userId") int userId);
	
	public Daily selectDaily(
			@Param("id") int id,
			@Param("userId") int userId
			);
	
	public int updatePost(@Param("id") int id,
			@Param("content") String content,
			@Param("category") String category);
	
	public int deletePost(
			@Param("id") int id,
			@Param("userId") int userId
			);
	
	public Community selectCommunityCategoryList(@Param("category") String category);
	
	public Community selectCommunityCategory(@Param("category") String category);
}
