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
<title>마이페이지</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />	
		<c:import url="/WEB-INF/jsp/include/menu.jsp" />	
		<div class="border-top"></div>
		
		<section>
			<div>
				<div class="d-flex justify-content-center align-items-center mt-4">
					<div class="d-flex justify-content-between w-50">
						<div>
							<h4>
							<c:if test="${not empty userName}">
								<img src="/image/profil.jpg" class="mypageprofil-size">
								${userName } 
							</c:if>
							</h4>
						</div>
						<div class="d-flex justify-content-center align-items-center">
						<a href="/user/userUpdate"><button type="button" class="uploadBtn btn btn-block btn-sm text-white" >내 정보 수정</button></a>
						</div>
					</div>
				</div>

				<div class="d-flex justify-content-center align-items-center mt-2">
					<div class="d-flex justify-content-between w-50">
						<h4>나의 펫밀리</h4>
						<a href="/user/mypet_view"><button type="button" class="uploadBtn btn btn-block btn-sm text-white" >등록하기</button></a>
					</div>
				</div>
				<div class="d-flex justify-content-center align-items-center">
					<div>
					<div class="petProfile-box border" style="border-radius: 50%; ">
						<img src="${myPet.imagePath }" class="petProfile">
					</div>
					<h5 class="text-center">${myPet.petName }</h5>
					</div>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />	
	</div>
</body>
</html>