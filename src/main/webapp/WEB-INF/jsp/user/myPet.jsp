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
  	
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<title>나의 반려동물 등록하기</title>
</head>
<style>
	.font{
	    font-family: 'NEXON Lv1 Gothic OTF';
	}
</style>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp" />	
	<c:import url="/WEB-INF/jsp/include/menu.jsp" />	
	
		<section class="d-flex justify-content-center mypet-box font">	
			<div class="login-box d-flex justify-content-center align-items-center mt-2">
				<div class="w-100">
					<h2 class="text-center mt-2">반려동물 등록하기</h2>
					<div class="border-top"></div>
					<form id="petForm">
						<div class="d-flex justify-content-center mt-2">
							<label for="gdsImg">반려동물 사진</label>
							<input type="file" accept="image/*" id="fileInput" class="col-10 mb-2 d-none">
							<a href="#" id="imageUploadBtn" class="a ml-2">추가</a>
						</div>
						<div class="d-flex justify-content-center">
							<div id="preview" class="profile-img border">
							   <img id="image_section" src="#" class="d-none w-100"/>
							</div>
						</div>
						<label>반려동물 이름</label>
						<input id="petNameInput" type="text" class="form-control" autocomplete="off">
						<div>
	                        <label class="mt-2 mr-2">반려동물 생일</label>
	                        <input type="text" class="form-control" id="petBirthdayInput" autocomplete="off">
                  		 </div>
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
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			function readURL(input) {
				 if (input.files && input.files[0]) {
				  var reader = new FileReader();
				  
				  reader.onload = function (e) {
				   $("#image_section").attr("src", e.target.result); 
				   $("#image_section").removeClass("d-none")
				  }
				  
				  reader.readAsDataURL(input.files[0]);
				  }
				}
				 
				$("#fileInput").change(function(){
				   readURL(this);
				});
				
			$("#imageUploadBtn").on("click", function(){
				$("#fileInput").click();
			});
			
			var petBirthday = null;
			$("#petBirthdayInput").datepicker({
                 showButtonPanel: true, 
                 currentText: '오늘',
                 dateFormat: "yy-mm-dd",
                 dayNamesMin:['월', '화', '수', '목', '금', '토', '일'],
			});
			
			
			$("#petForm").on("submit", function(e){
				e.preventDefault();
				
				var petName = $("#petNameInput").val();
				petBirthday = $("#petBirthdayInput").val();
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
				
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 추가하세요");
					return ;
				}
				
				var formData = new FormData();
				formData.append("petName", petName);
				formData.append("petBirthday", petBirthday);
				formData.append("petGender", petGender);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					enctype:"mutipart/form-data",
					type:"POST",
					url:"/user/myPet",
					processData: false,
					contentType: false,
					data:formData,
					success:function(data){
						if(data.result == "success") {
							alert("등록되었습니다");
							location.href="/user/myPage"
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