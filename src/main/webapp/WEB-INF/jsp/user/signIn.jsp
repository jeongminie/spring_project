<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	<link rel="stylesheet" href="/css/style.css">

  	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<title>로그인</title>
</head>
<style>
	.font{
	    font-family: 'NEXON Lv1 Gothic OTF';
	}
</style>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/jsp/include/signHeader.jsp"/>
		<section class="d-flex justify-content-center mt-2 font">	
			<div class="login-box  d-flex justify-content-center align-items-center">
				<div class="w-100">
					<h2 class="text-center">로그인</h2>
					<form id="loginForm">
						<input id="loginEmailInput" type="text" class="form-control mt-4" placeholder="이메일을 입력해주세요" autocomplete="off">
						<input id="passwordInput" type="password" class="form-control mt-3" placeholder="비밀번호를 입력해주세요">
						<button id="loginBtn" type="submit" class="btn btn-primary btn-block mt-3">로그인</button>
					</form>
					<div class="border-top mt-3"></div>
					<div class="text-center mt-2" ><a href="/user/signUp_view">회원가입</a></div>
					
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			$("#loginForm").on("submit", function(e){
				e.preventDefault();
				
				var loginEmail = $("#loginEmailInput").val();
				var password = $("#passwordInput").val();
				
				if(loginEmail == null || loginEmail == ""){
					 alert("이메일을 입력해주세요");
					 return;
				}
				
				if(password == null || password == ""){
					 alert("비멀번호를 입력해주세요");
					 return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginEmail":loginEmail, "password":password},
					success:function(data){
						if(data.result == "success") {
							location.href="/post/main";
						} else {
							alert("이메일과 비밀번호를 확인하세요");
						}
					},
					error:function(e){
						alert("로그인실패");
					}
				});
			});
		});
	
	
	</script>

</body>
</html>