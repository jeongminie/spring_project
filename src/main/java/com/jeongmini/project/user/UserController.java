package com.jeongmini.project.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeongmini.project.user.bo.UserBO;
import com.jeongmini.project.user.model.MyPet;

@Controller
public class UserController {
	@Autowired
	private UserBO userBO;
	
	@GetMapping("/user/signIn_view")
	public String signInView() {
		return "user/signIn";
	}
	
	@GetMapping("/user/signUp_view")
	public String signUpView() {
		return "user/signUp";
	}
	
	/*
	 * @GetMapping("/mypet_view") public String mypetView() { return "user/myPet"; }
	 */
	@GetMapping("/info/mypet_view")
	public String mypetModel(Model model) {
		
		MyPet myPet = userBO.getMyPet();
		model.addAttribute("myPet", myPet);
		
		return "info/myPet";
	}

	@GetMapping("/user/sign_out")
	public String signOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("name");

		return "redirect:/user/signIn_view";
	}
	
	@GetMapping("/info/myPage")
	public String mypageView(Model model) {
		MyPet myPet = userBO.getMyPet();
		model.addAttribute("myPet", myPet);
		
		return "info/myPage";
	}
	
<<<<<<< HEAD
	@GetMapping("/mypage2")
	public String mapage2() {
		return "user/mypage2";
	}
	
	@GetMapping("/userUpdate")
=======
	@GetMapping("/info/userUpdate")
>>>>>>> develop
	public String userUpdate() {
		return "info/userUpdate";
	}

}
