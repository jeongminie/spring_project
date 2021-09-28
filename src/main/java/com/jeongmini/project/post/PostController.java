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
	public String dailyView(
			Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		List<Daily> daily = postBO.getDaily(userId);

		model.addAttribute("daily", daily);
		
		return "post/daily";
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
}
