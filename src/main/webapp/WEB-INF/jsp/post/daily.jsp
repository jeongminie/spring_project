<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<link href='/css/fullcalendar/main.css' rel='stylesheet' />
	<script src='/css/fullcalendar/main.js'></script>

</head>	
  	<link rel="stylesheet" href="/css/style.css">
<script>

 	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
		  initialView: 'dayGridMonth'
		});
		calendar.render();
		
			    events: [
			               $.ajax({
			            	 type:"get",
			            	 url:"/post/dailyData",
			            	 data:{},
			            	 success:function(data) {
			            		 result = data.result
			            		 for(i=0; i<result.length; i++) {
			            			 calendar.addEvent({
			            				title:result[i]['content'],
			            				start:result[i]['createdAt'],
			            				start:result[i]['updatedAt'],
			            			 })
			            		 }
			            	 }
			          })
			       ]
			  });

</script>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<c:import url="/WEB-INF/jsp/include/menu.jsp" />
		
		<div class="border-top"></div>
		
		<a style="display:scroll;position:fixed;bottom:10px;right:300px;" href="/post/createDaily" title=”top"><img src="/image/write.png" class="writeImage-size"></a>
		
		<div id='calendar'></div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
</body>
</html>