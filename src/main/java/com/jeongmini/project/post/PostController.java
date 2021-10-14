package com.jeongmini.project.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeongmini.project.post.bo.PostBO;
import com.jeongmini.project.post.model.Community;
import com.jeongmini.project.post.model.Daily;
import com.jeongmini.project.post.model.PostWithComments;
import com.jeongmini.project.post.sympathy.bo.SympathyBO;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/main")
	public String mainView(
			Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		List<PostWithComments> postWithComments = postBO.getCommunityList(userId);
		model.addAttribute("postWithComments", postWithComments);
		
		return "post/main";
	}
	
	@GetMapping("/create")
	public String createView() {
		return "post/create";
	}
	
	@GetMapping("/createDaily")
	public String createDailyView() {
		return "post/createDaily";
	}
	
	@GetMapping("/daily")
	public String dailyView() {
		return "post/daily";
	}
	
	@GetMapping("/daily_detail")
	public String dailyDetail(
			@RequestParam("id") int id,
			Model model,
			HttpServletRequest request) { 
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");

		Daily daily = postBO.getDaily(id, userId);

		model.addAttribute("daily", daily);
		
		return "post/dailyDetail"; 
	}

	@GetMapping("detail_view")
	public String detailView(
			@RequestParam("id") int id,
			Model model,
			HttpServletRequest request) {
		
		Community community = postBO.getCommunity(id);
		model.addAttribute("community", community);
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		List<PostWithComments> postWithComments = postBO.getCommunityList(userId);		
		model.addAttribute("postWithComments", postWithComments);

		return "post/detail";
	}
	
	@GetMapping("/category_view")
	public String categoryView(
			@RequestParam("category") String category,
			Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		Community community = postBO.getCommunityCategoryList(category);
		model.addAttribute("community", community);
		
		List<PostWithComments> postWithComments = postBO.getCommunityList(userId);
		model.addAttribute("postWithComments", postWithComments);
		
		return "post/category";
	}
	
	@GetMapping("/update_view")
	public String postUpdate(@RequestParam("id") int id,
			Model model) {
		
		Community community = postBO.getCommunity(id);
		model.addAttribute("community", community);
		
		return "post/postUpdate";
	}
	

	public String categoryMenu(
			@RequestParam("category") String category,
			Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		Community community = postBO.getCommunityCategory(category);
		model.addAttribute("community", community);
		
		List<PostWithComments> postWithComments = postBO.getCommunityList(userId);
		model.addAttribute("postWithComments", postWithComments);
		
		return "include/menu";
	}
}
