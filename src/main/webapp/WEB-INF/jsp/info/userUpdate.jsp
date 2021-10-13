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
<title>내 정보 수정</title>
</head>
<script>
</script>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<c:import url="/WEB-INF/jsp/include/menu.jsp" />
		
		<section class="d-flex justify-content-center mt-2">
			<div class="signup-box d-flex align-items-center">
				<div class="w-100">
					<h2 class="text-center mb-4">내 정보 수정</h2>
					<form id="updateForm">
						<div class="mb-2">
						닉네임
						<div class="d-flex">
							<input id="nameInput" type="text" class="form-control col-9" value="${userName}">
							<button type="button" class="btn btnColor text-white ml-2" id="nameCheckBtn">중복 확인</button>
						</div>
						<div><small class="text-danger d-none" id="duplicationName">중복된 닉네임 입니다.</small></div>
						<div><small class="text-success d-none" id="ableName">사용 가능한 닉네임 입니다.</small></div>
						</div>
						<div class="mb-2">
						비밀번호
						<input id="passwordInput" type="password" class="form-control mb-2" value="${password }" onfocus="this.value=''">
						비밀번호 확인
						<input id="passwordConfirmInput" type="password" class="form-control mb-2" value="${password }" onfocus="this.value=''">
						<small id="errorPassword" class="text-danger d-none">비밀번호가 일치하지 않습니다.</small>						
						</div>
						<button type="submit" id="signUpBtn" class="btn btnColor text-white btn-block mt-3">수정</button>
					</form>
			</div>
				</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
		$(document).ready(function(){
			//체크안함
			var isUserNameCheck = false;
			//중복
			var isDuplicateUserName = true;
			
			$("#updateForm").on("submit", function(e){
				e.preventDefault();
				
				var name = $("#nameInput").val();
				var email = $("#emailInput").val();
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				
				if(password != passwordConfirm) {
					$("#errorPassword").removeClass("d-none");
					return false;
				}
				
				if(isUserNameCheck == false) {
					alert("닉네임 중복체크를 해주세요");
					return ;
				}
				
				if(isDuplicateUserName == true) {
					alert("닉네임이 중복되었습니다.");
					return ;
				}
				
				$.ajax({
				type:"post",
				url:"/user/update",
				data:{"name":name, "password":password},
				success:function(data){
					if(data.result == "success"){
						alert("정보가 수정되었습니다")
						location.href="/user/myPage";
					}
				},
				error:function(e){
					alert(e)
					
				}
			});
				
		});
				
				$("#nameCheckBtn").on("click", function(){
					var name = $("#nameInput").val();
					
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
					
		});
	
	</script>

</body>
</html>