package com.jeongmini.project.post.sympathy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jeongmini.project.post.sympathy.model.Sympathy;

@Repository
public interface SympathyDAO {

	public int insertSympathy(@Param("userId") int userId,
			@Param("postId") int postId);
	
	public int selectCountSympathy(@Param("userId") int userId,
			@Param("postId") int postId);
	
	public int deleteSympathy(@Param("userId") int userId,
			@Param("postId") int postId);
	
	public int selectCountSympathyByPostId(@Param("postId") int postId);
	
	public List<Sympathy> selectSympathyUserId(@Param("postId") int postId);
	
	public int deletePostSympathy(@Param("postId") int postId);
}
