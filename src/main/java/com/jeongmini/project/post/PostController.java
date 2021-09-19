package com.jeongmini.project.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@GetMapping("/main")
	public String mainView() {
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
