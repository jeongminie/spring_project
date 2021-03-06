<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<title>일기</title>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	<link rel="stylesheet" href="/css/style.css">
  	
  	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/favicon.ico" type="image/x-icon">

</head>
<style>
	.dailyFont {
	font-family: 'GowunDodum-Regular';
	}
</style>
<body>

<div id="wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<c:import url="/WEB-INF/jsp/include/menu.jsp" />

		<section class="dailyFont">
			<div class="d-flex justify-content-center align-items-center p-4">
				<div class="box-border rounded">
					<div>
						<h4 class="text-center font-weight-bold mt-2">
							<fmt:formatDate value="${daily.createdAt}" pattern="yyyy년 M월 d일" />
						</h4>
					</div>
					<div class="border-top"></div>
					<div class="d-flex">
					<div>
						<div class="p-4 dailycontent-box">
							${daily.content }
						</div>
					</div>
					<div class="border-right"></div>
					<div class="dailycontent-box">
					<div class="p-4">
						<h4 class="text-center">오늘 ${petName }의 하루</h4>
						<div class="d-flex justify-content-center">
							<h5 class="mr-2">기분</h5>
							<img src="/image/${daily.condition }.png" class="dailyDetailImageSize">
						</div> 
						<div class="d-flex justify-content-center">
							<h5 class="mr-2">건강</h5>
							${daily.health }</div> 
						<div class="d-flex justify-content-center">
							<h5 class="mr-2">배변상태</h5>
							${daily.defecation }
						</div> 
						<div class="d-flex justify-content-center">
							<h5 class="mr-2">산책</h5>
							<c:choose>
								<c:when test="${daily.walk eq 0}">
									<img src="/image/no.png" class="yesornoImage-size">
								</c:when>
								<c:otherwise>
									<img src="/image/yes.png" class="yesornoImage-size">
								</c:otherwise>
							</c:choose>						
						</div> 
						<div class="d-flex justify-content-center">
							<h5 class="mr-2">약 복용</h5>
							<c:choose>
								<c:when test="${daily.medicine eq 0}">
									<img src="/image/no.png" class="yesornoImage-size">
								</c:when>
								<c:otherwise>
									<img src="/image/yes.png" class="yesornoImage-size">
								</c:otherwise>
							</c:choose>	
						</div> 

					</div>
					</div>
				</div>
			</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
</div>		

</body>
</html>