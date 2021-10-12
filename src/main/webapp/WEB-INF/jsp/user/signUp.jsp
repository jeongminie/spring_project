<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	<link rel="stylesheet" href="/css/style.css">

  	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>
<body>
	<div id="wrap"> 
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="d-flex justify-content-center mt-2">
			<div class="signup-box d-flex align-items-center">
				<div class="w-100">
					<h2 class="text-center mb-4">회원가입</h2>
					<form id="signupForm">
						닉네임
						<div class="d-flex">
							<input id="nameInput" type="text" class="form-control col-9">
							<button type="button" class="btn btnColor text-white ml-2" id="nameCheckBtn">중복 확인</button>
						</div>
							<div><small class="text-danger d-none" id="duplicationName">중복된 닉네임 입니다.</small></div>
							<div><small class="text-success d-none" id="ableName">사용 가능한 닉네임 입니다.</small></div>
						이메일
						<div class="d-flex">
							<input id="emailInput" type="text" class="form-control col-9">
							<button type="button" class="btn btnColor ml-2 text-white" id="emailCheckBtn">중복 확인</button>
						</div>
						<div><small class="text-danger d-none" id="duplicationEmail">중복된 이메일 입니다.</small></div>
						<div><small class="text-success d-none" id="ableEmail">사용 가능한 이메일 입니다.</small></div>
						비밀번호
						<input id="passwordInput" type="password" class="form-control mb-2">
						비밀번호 확인
						<input id="passwordConfirmInput" type="password" class="form-control mb-2">
						<small id="errorPassword" class="text-danger d-none">비밀번호가 일치하지 않습니다.</small>
						반려동물 이름
						<input id="petNameInput" type="text" class="form-control">
						<button type="submit" id="signUpBtn" class="btn btnColor text-white btn-block mt-3">회원가입</button>		
					</form>
				</div>
			</div>
		</section>
	</div>
	
	<script>
		$(document).ready(function(){
				//체크안함
				var isUserNameCheck = false;
				var isEmailCheck = false;
				//중복
				var isDuplicateUserName = true;
				var isDuplicateEmail = true;
				$("#signupForm").on("submit", function(e){
					e.preventDefault();
					
					var name = $("#nameInput").val();
					var email = $("#emailInput").val();
					var password = $("#passwordInput").val();
					var passwordConfirm = $("#passwordConfirmInput").val();
					var petName = $("#petNameInput").val();
					
					if(name == null || name == "") {
						alert("닉네임을 입력하세요");
						return false ;
					}
					
					if(email == null || email == "") {
						alert("이메일을 입력하세요");
						return false ;
					}
					
					if(password == null || password == "") {
						alert("비밀번호를 입력하세요");
						return false ;
					}
					
					if(password != passwordConfirm) {
						$("#errorPassword").removeClass("d-none");
						return false;
					}
					
					if(name == null || name == "") {
						alert("닉네임을 입력하세요");
						return false ;
					}
					
					if(isUserNameCheck == false) {
						alert("닉네임 중복체크를 해주세요");
						return ;
					}
					
					if(isEmailCheck == false) {
						alert("이메일 중복체크를 해주세요");
						return ;
					}
					
					if(isDuplicateUserName == true) {
						alert("닉네임이 중복되었습니다.");
						return ;
					}
					
					if(isDuplicateEmail == true) {
						alert("이메일이 중복되었습니다.");
						return ;
					}
					
					
					$.ajax({
						type:"post",
						url:"/user/sign_up",
						data:{"name":name, "email":email, "password":password, "petName":petName},
						success:function(data){
							if(data.result == "success"){
								alert("회원가입이 완료되었습니다. 로그인 해주세요")
								location.href="/user/signIn_view";
							}
						},
						error:function(e){
							
						}
					});
					
					return false;
		
				});
				
				$("#nameCheckBtn").on("click", function(){
					var name = $("#nameInput").val();
					
					if(name == null || name == "") {
						alert("닉네임을 입력하세요");
						return false ;
					}
					
					$.ajax({
						type:"get",
						url:"/user/is_duplicate_name",
						data:{"name":name},
						success:function(data) {
							isUserNameCheck = true;
							
							if(data.duplication) {
								isDuplicateUserName = true;
								$("#duplicationName").removeClass("d-none");
								$("#ableName").addClass("d-none");						
							} else {
								isDuplicateUserName = false;
								$("#duplicationName").addClass("d-none");
								$("#ableName").removeClass("d-none");	
							}	
						},
						error:function(e){
							alert("에러")
						}
					});
					
				});
				
					$("#emailCheckBtn").on("click", function(){
						var email = $("#emailInput").val();
						
						if(email == null || email == "") {
							alert("이메일을 입력하세요");
							return false ;
						}
						
						$.ajax({
							type:"get",
							url:"/user/is_duplicate_email",
							data:{"email":email},
							success:function(data) {
								isEmailCheck = true;
								
								if(data.duplication) {
									isDuplicateEmail = true;
									$("#duplicationEmail").removeClass("d-none");
									$("#ableEmail").addClass("d-none");						
								} else {
									isDuplicateEmail = false;
									$("#duplicationEmail").addClass("d-none");
									$("#ableEmail").removeClass("d-none");	
								}	
							},
							error:function(e){
								alert("에러")
							}					
					});		
				});
		});
				
	</script>

</body>
</html>