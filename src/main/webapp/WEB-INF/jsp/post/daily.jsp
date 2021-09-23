<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %> 

<%
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
	Date date = format.parse("2021-09");

	Calendar cal = Calendar.getInstance();
	cal.setTime(date);
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int day = cal.get(Calendar.DAY_OF_MONTH);
	
	//해당월의 첫날
	int startDate = cal.getMinimum(Calendar.DATE);
	//해당월의 마지막 날
	int endDate = cal.getActualMaximum(Calendar.DATE);
	//1일의 요일
	int startDay = cal.get(Calendar.DAY_OF_WEEK);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	<link rel="stylesheet" href="/css/style.css">
<title>집사일기</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/menu.jsp" />
		<div class="border-top"></div>
		<section class="bg-color">
		<div>
			<c:if test="${not empty userPetName}">
				<h3 class="text-center mt-2">${userPetName }의 하루</h3>
			</c:if>
		</div>
		<div class="daily-box d-flex">
		<c:forEach var="daily" items="${daily }">
			<fmt:formatDate var="dailyMonth" value="${daily.createdAt}" pattern="MM월 dd일 " />

				${dailyMonth}
		</c:forEach>
		</div>
		
		
		</section>
	</div>



</body>
</html>