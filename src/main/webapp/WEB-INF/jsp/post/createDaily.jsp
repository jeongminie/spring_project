<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar" %>
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
<title>집사일기 작성</title>
</head>
<body>
	<%
	Date nowTime = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 M월 d일");
	%>
	<div id="wrap">
		<section>
				<div class="d-flex justify-content-center align-items-center p-4">
					<div class="box-border rounded">
						<div>
							<h4 class="text-center font-weight-bold mt-2">
								<%=formatter.format(nowTime.getTime()) %>
							</h4>
							<div class="category-box d-flex justify-content-center">
								<!-- <div class="d-flex align-items-center"><a href="#" class="text-secondary" id="conditionInput">오늘의 기분</a></div> -->
								<div>
									<a href="#"><img src="/images/행복.png" class="conditionImageSize mr-2" id="행복" name="condition"></a>
									<a href="#" class="conditionClick"><img src="/images/보통.png" class="conditionImageSize mr-2" id="보통" name="condition"></a>
									<a href="#" class="conditionClick"><img src="/images/완전보통.png" class="conditionImageSize mr-2" id="완전보통" name="condition"></a>
									<a href="#" class="conditionClick"><img src="/images/슬픔.png" class="conditionImageSize mr-2" id="슬픔" name="condition"></a>
									<a href="#" class="conditionClick"><img src="/images/화남.png" class="conditionImageSize mr-2" id="화남" name="condition"></a>
								</div>
							</div>
						<div class="border-top"></div>
						</div>
						<article class="text-box w-100">
							<div class="textbox-size text-secondary p-2">
								<textarea class="form-control border-0 non-resize" rows="10" placeholder="오늘의 반려일기를 기록해주세요 ..." id="contentInput"></textarea>
							</div>
						</article>
						<div class="border-top"></div>
						<article class="p-2">
							<label class="text-secondary">건강</label>
							<select class="form-control" id="healthInput">
								<option>선택</option>
								<option>양호</option>
								<option>보통</option>
								<option>나쁨</option>
							</select>
							<label class="text-secondary">배변</label>
							<select class="form-control" id="defecationInput">
								<option>선택</option>
								<option>보통변</option>
								<option>묽은변</option>
								<option>설사</option>
							</select>
						</article>
						<div class="p-2">
							<button type="button" class="uploadBtn btn btn-block btn-sm text-white" id="saveBtn">기록하기</button>
						</div>
						
					</div>
				</div>			
			</section>
	</div>
	
	<script>	
		
		$(document).ready(function(){						
			$("img[name='condition']").on("click", function(){
				var condition = $(this).attr("id");
			
			$("#saveBtn").on("click",function(){

			var content = $("#contentInput").val().trim();
			var health = $("#healthInput option:selected").val();
			var defecation = $("#defecationInput option:selected").val();
			
				
			if(content == null || content == "") {
				alert("내용을 입력하세요");
				return ;
			}
						
			if(health == '선택') {
				alert("건강상태를 선택하세요");
				return ;
			}
			
			if(defecation == '선택') {
				alert("대변상태를 선택하세요");
				return ;
			}
			
			if(condition == null) {
				alert("오늘의 기분을 선택하세요");
				return ;
			}
			
			$.ajax({
				type:"post",
				url:"/post/createDaily",
				data:{"content":content, "condition":condition, "health":health, "defecation":defecation},
				success:function(data){
					if(data.result == "success") {
						isConditionClick = true;
						alert("업로드 성공");					 
					} else {
						alert("업로드 실패");
					}
				},
				error:function(e) {
					alert("error");
				}
				
				});
				
				return false;
				
				});			
			});
		});

	</script>
	
<!-- 				$("img[name='condition']").on("click", function(){
					var condition =  $(this).attr("id"); -->

</body>
</html>