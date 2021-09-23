package com.jeongmini.project.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeongmini.project.post.bo.PostBO;
import com.jeongmini.project.post.model.Community;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/main")
	public String mainView(Model model) {
		List<Community> communityList = postBO.getCommunityList();
		model.addAttribute("communityList", communityList);
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
	
}
