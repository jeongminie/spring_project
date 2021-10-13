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
  	
  	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap" rel="stylesheet">

<title>글 작성</title>
</head>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<c:import url="/WEB-INF/jsp/include/menu.jsp" />
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
								<textarea class="form-control border-0 non-resize" rows="10" placeholder="내용을 입력해주세요 ..." id="contentInput"></textarea>
								<input type="file" accept="image/*" id="fileInput" class="col-10 mb-2 d-none">
								<a href="#" id="imageUploadBtn"><i class="bi bi-images text-dark ml-2"></i></a>
							</div>
							<div class="border-top"></div>
							<div class="category-box mt-2">
								<select class="border-0 col-12 text-secondary form-control" id="selectInput">
									<option value="category">카테고리</option>
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
								<button type="button" class="uploadBtn btn btn-block btn-sm text-white" id="saveBtn">업로드</button>
							</div>
						</article>
					</div>
				</div>
			</div>
			
		</section>
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#imageUploadBtn").on("click", function(){
				$("#fileInput").click();
			});
			
			$("#saveBtn").on("click",function(){
				var content = $("#contentInput").val().trim();
				var category = $("#selectInput").val().trim();
				/* var category = $("#selectInput option:selected").data("category-id"); */
				
				if(content == null || content == "") {
					alert("내용을 입력하세요");
					return ;
				}
				
				if(category == 'category') {
					alert("카테고리를 입력하세요");
					return ;
				}
				
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 추가하세요");
					return ;
				}
				
				var formData = new FormData();
				formData.append("content", content);
				formData.append("category", category);
				formData.append("file", $("#fileInput")[0].files[0]);
					
					$.ajax({
						enctype:"mutipart/form-data",
						type:"POST",
						url:"/post/create",
						processData: false,
						contentType: false,
						data:formData,
						success:function(data){
							if(data.result == "success") {
								location.href="/post/main";
							} else {
								alert("업로드 실패");
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