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
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	<link rel="stylesheet" href="/css/style.css">
<title>글 수정</title>
</head>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section>
			<div class="d-flex justify-content-center align-items-center p-4">
				<div class="box-border rounded">
					<div>
						<h4 class="text-center font-weight-bold mt-2">글 쓰기</h4>
						<div class="border-top"></div>
					</div>
					<div class="d-flex">
						
						<article class="w-100">
							<div class="text-box text-secondary p-2">
								<textarea class="form-control border-0 non-resize" rows="10" id="contentInput">${community.content }</textarea>
							</div>
							<div class="border-top"></div>
							<div class="category-box mt-2">
								<select class="border-0 col-12 text-secondary form-control" id="selectInput">
									<option value="category" selected>${community.category }</option>
							    	<option>일상</option>
							    	<option>광고</option>
							    	<option>리뷰</option>
						    	<!-- <option data-category-id="category">카테고리</option>
						    	<option data-category-id="daily">일상</option>
						    	<option data-category-id="ad">광고</option>
						    	<option data-category-id="review">리뷰</option> -->
								</select>
							</div>
							<div class="p-2">
								<button type="button" class="uploadBtn btn btn-block btn-sm text-white" id="saveBtn" data-post-id="${community.id }">업로드</button>
							</div>
						</article>
					</div>
				</div>
			</div>
			
		</section>
	</div>
	
	<script>
		$(document).ready(function(){
			$("#saveBtn").on("click",function(){
				var content = $("#contentInput").val().trim();
				var category = $("#selectInput").val().trim();
				var postId = $(this).data("post-id");
					
					$.ajax({
						type:"get",
						url:"/post/update",
						data:{"postId":postId, "content":content, "category":category},
						success:function(data){
							if(data.result == "success") {
								location.href="/post/detail_view?id=${community.id }";
							}
						},
						error:function(e) {
							alert("error");
						}
			});
		});
		});
	</script>

</body>
</html>