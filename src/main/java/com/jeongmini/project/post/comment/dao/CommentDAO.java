package com.jeongmini.project.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jeongmini.project.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("postId") int postId,
			@Param("comment") String comment);
	
	public List<Comment> selectCommentList(@Param("postId") int postId);

	public int selectCommentTotalCount(@Param("postId") int postId);
	
	public int deleteComment(@Param("id") int id, @Param("userId") int userId );
	
	public int deletePostComment(@Param("postId") int postId);
}
