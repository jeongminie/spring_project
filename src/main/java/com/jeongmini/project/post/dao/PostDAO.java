package com.jeongmini.project.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jeongmini.project.post.model.Community;

@Repository
public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int id,
			@Param("userName") String userName,
			@Param("content") String content,
			@Param("category") String category,
			@Param("imagePath") String imagePath
			);
	
	public int insertPostDaily(
			@Param("userId") int id,
			@Param("userName") String userName,
			@Param("content") String content,
			@Param("condition") String condition,
			@Param("health") String health,
			@Param("defecation") String defecation
			);
	
	public List<Community> selectCommunityList();
}
