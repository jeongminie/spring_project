package com.jeongmini.project.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jeongmini.project.post.bo.PostBO;
import com.jeongmini.project.post.model.Daily;

@RestController
@RequestMapping("/post")
public class PostRestController {
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("content") String content,
			@RequestParam("category") String category,
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
	
		int count = postBO.addPost(userId, userName, content, category, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;

	}
	
	@PostMapping("/createDaily")
	public Map<String, String> createDaily(
			@RequestParam("content") String content,
			@RequestParam("condition") String condition,
			@RequestParam("health") String health,
			@RequestParam("defecation") String defecation,
			@RequestParam("walk") boolean walk,
			@RequestParam("medicine") boolean medicine,
			@RequestParam("imageurl") String imageurl,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");

		int count = postBO.addPostDaily(userId, userName, content, condition, health, defecation, walk, medicine, imageurl);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;

	}
	
	@GetMapping("/dailyData")
	public List<Daily> daily(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		return postBO.getDailyList(userId);
	}
	
	@GetMapping("/update")
	public Map<String, String> update(@RequestParam("postId") int postId,
			@RequestParam("category") String category,
			@RequestParam("content") String content){
		
		int count = postBO.updatePost(postId, content, category);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	} 
	
	@GetMapping("/delete_post")
	public Map<String, String> deletePost (
			@RequestParam("postId") int postId,
			HttpServletRequest request
			){
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		//int postId = (Integer)session.getAttribute("postId");
		
		Map<String, String> result = new HashMap<>();
		
		if(postBO.deletePost(postId, userId)) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}


}
