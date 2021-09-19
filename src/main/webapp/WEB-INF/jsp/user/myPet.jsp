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
<title>나의 반려동물 등록하기</title>
</head>
<body>
	<div id="wrap">
		<section class="d-flex justify-content-center">	
			<div class="login-box  d-flex justify-content-center align-items-center">
				<div class="w-100">
					<h2 class="text-center">반려동물 등록하기</h2>
					<form id="petForm">
						<label>반려동물 이름</label>
						<input id="petNameInput" type="text" class="form-control">
						<label class="mt-2">반려동물 생일</label>
						<input id="petBirthdayInput" type="date" class="form-control">
						<label class="mt-2">반려동물 성별</label>
						<select id="petgenderInput" class="form-control">
							<option>선택</option>
							<option>암컷</option>
							<option>수컷</option>
							<option>중성</option>
						</select>
						<button id="loginBtn" type="submit" class="btn btn-primary btn-block mt-3">등록</button>
					</form>				
				</div>
			</div>
		</section>
	</div>
	
	<script>
		$(document).ready(function(){
			$("#petForm").on("submit", function(e){
				e.preventDefault();
				
				var petName = $("#petNameInput").val();
				var petBirthday = $("#petBirthdayInput").val();
				var petGender = $("#petgenderInput option:selected").val().trim();
				
				if(petName == null || petName == ""){
					 alert("반려동물 이름을 입력해주세요");
					 return;
				}
				
				if(petBirthday == null || petBirthday == ""){
					 alert("반려동물 생일을 입력해주세요");
					 return;
				}
				
				if(petGender == '선택'){
					 alert("반려동물 성별을 입력해주세요");
					 return;
				}
				
				
				$.ajax({
					type:"post",
					url:"/user/myPet",
					data:{"petName":petName, "petBirthday":petBirthday, "petGender":petGender},
					success:function(data){
						if(data.result == "success") {
							alert("등록 성공");
							//location.href="/post/main";
						} else {
							alert("실패");
						}
					},
					error:function(e){
						alert("에러");
					}
				});
			});
		});
	
	
	</script>
</body>
</html>