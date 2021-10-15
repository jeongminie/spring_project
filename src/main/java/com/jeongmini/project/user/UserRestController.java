package com.jeongmini.project.user;

import java.util.HashMap;
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

import com.jeongmini.project.user.bo.UserBO;
import com.jeongmini.project.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	@Autowired
	private UserBO userBO;

	@PostMapping("/sign_in")
	public Map<String, String> signIn(
			@RequestParam("loginEmail") String loginEmail,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		
		Map<String, String> result = new HashMap<>();
		User user = userBO.signIn(loginEmail, password);
		
		if(user != null) {
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userEmail", user.getEmail()); 
			session.setAttribute("password", user.getPassword()); 
			session.setAttribute("petName", user.getPetName());
			
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String,String> signUp(
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			@RequestParam("petName") String petName
			) {
		Map<String, String> result = new HashMap<>();
		int count = userBO.signUp(name, email, password, petName);
		
		if(count ==1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/is_duplicate_name")
	public Map<String, Boolean> isDuplicateName(
			@RequestParam("name") String name) {
		Map<String, Boolean> result = new HashMap<>();
		
		if(userBO.existUserName(name)) {
			result.put("duplication", true);
		} else {
			result.put("duplication", false);
		}
		
		return result;
	}
	
	@GetMapping("/is_duplicate_email")
	public Map<String, Boolean> isDuplicateEmail(
			@RequestParam("email") String email) {
		Map<String, Boolean> result = new HashMap<>();
		
		if(userBO.existUserEmail(email)) {
			result.put("duplication", true);
		} else {
			result.put("duplication", false);
		}
		
		return result;
	}
	
	@PostMapping("/myPet")
	public Map<String,String> myPet(
			@RequestParam("petName") String petName,
			@RequestParam("petBirthday") String petBirthday,
			@RequestParam("petGender") String petGender,
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		Map<String, String> result = new HashMap<>();
		int count = userBO.myPet(userId, userName, petName, petBirthday, petGender, file);
		
		if(count ==1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/update")
	public Map<String, String> update(
			@RequestParam("name") String name,
			@RequestParam("password") String password,
			HttpServletRequest request
			){
		
		HttpSession session = request.getSession();
		int id = (Integer)session.getAttribute("userId");
		
		int count = userBO.userUpdate(id, name, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
