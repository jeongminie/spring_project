package com.jeongmini.project.post.sympathy.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SympathyDAO {

	public int insertSympathy(@Param("userId") int userId,
			@Param("postId") int postId);
	
	public int selectCountSympathy(@Param("userId") int userId,
			@Param("postId") int postId);
}
