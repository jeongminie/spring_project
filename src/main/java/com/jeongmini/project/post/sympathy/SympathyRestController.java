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
	public Map<String, Boolean> Sympathy (
			@RequestParam("postId") int postId,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		boolean sympathy = sympathyBO.sympathy(userId, postId);
		
		Map<String, Boolean> result = new HashMap<>();		
		
		result.put("sympathy", sympathy);
		
		return result;
			
	}

}
