package com.jeongmini.project.post.sympathy;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jeongmini.project.post.sympathy.bo.SympathyBO;

@RestController
@RequestMapping("/post")
public class SympathyRestController {
	@Autowired
	private SympathyBO sympathyBO;
	
	@GetMapping("/sympathy")
	public Map<String, String> Sympathy (
			@RequestParam("postId") int postId,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = sympathyBO.addSympathy(userId, postId);
		Map<String, String> result = new HashMap<>();		
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
			
	}

}
