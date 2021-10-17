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
<title>펫밀리</title>
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
		
		<section class="font">
		<div class="d-flex justify-content-center align-items-center mt-4">
			<div class="timeLine">
				<div class="userInfo p-2">
				<div class=" d-flex justify-content-between mb-2">
					<div class="d-flex justify-content-center align-items-center">
						<img src="/image/profil.jpg" class="headerprofil-size mr-1">${community.userName }
					</div>
					<div>
						<c:if test="${community.userId eq userId }">
							<a href="#" class="text-dark morePostBtn" data-toggle="modal" data-target="#PostModal" data-post-id="${community.id }">
								<i class="bi bi-three-dots mr-2"></i>
							</a>
						</c:if>
					</div>
				</div>
					<div class="border-top"></div>
					<div class="d-flex align-items-center ml-2">
						<div class="categoryStyle border-radius mr-2 mt-2 text-secondary d-flex justify-content-center align-items-center">${community.category }</div>
					</div>
					<div class="p-2">
						${community.content }
					</div>
					<div class="p-2">
						<c:if test="${not empty community.imagePath }">
							<img src="${community.imagePath }" class="imagePath-size w-100 imageClick" data-post-id="${community.id }">
						</c:if>
					</div>
					<div class="border-top"></div>
					<div class="d-flex p-2">
						<div class="mr-4">
						<c:choose>
							<c:when test="${community.existSympathy eq false}">
								<a href="#" class="sympathyBtn" data-post-id="${community.id }">
									<i class="bi bi-suit-heart text-dark mr-1" id="heartIcon-${community.id }"></i>
								</a>			
							</c:when>
							<c:otherwise>
								<a href="#" class="sympathyBtn" data-post-id="${community.id }">
									<i class="bi bi-suit-heart-fill heartIconFill mr-1" id="heartIcon-${community.id }"></i>
								</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${community.sympathyTotalCount eq 0 }">
								<a href="#" class="sympathyBtn" data-post-id="${community.id }"><small class="text-secondary">공감하기</small></a>
							</c:when>
							<c:when test="${community.sympathyTotalCount > 0 }">
								<a href="#" class="sympathyBtn" data-post-id="${community.id }"><small class="text-secondary">공감 ${community.sympathyTotalCount }개</small></a>
							</c:when>
						</c:choose>
						</div>
						<c:choose>
							<c:when test="${community.commentTotalCount eq 0}" >
								<div class="d-flex align-items-center justify-content-center">
									<a href="/post/detail_view?id=${community.id }">
										<i class="bi bi-chat text-dark"></i>
										<small class="text-secondary">댓글쓰기</small>
									</a>		
								</div>							
							</c:when>
							<c:otherwise>
								<div class="d-flex align-items-center justify-content-center">
									<i class="bi bi-chat text-dark"></i>
									<small class="text-secondary">댓글 ${community.commentTotalCount }개</small>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="border-top"></div>
					
						<c:forEach var="comment" items="${community.commentList }" varStatus="status">					
							<div class="d-flex justify-content-between p-1">
								<div>
									<b>${comment.userName }</b> ${comment.comment }
								</div>
								<div>
									<c:if test="${comment.userId eq userId }">
									<a href="#" class="text-dark moreCommentBtn" data-toggle="modal" data-target="#CommentdeleteModal" data-comment-id="${comment.id }">
										<i class="bi bi-three-dots mr-2"></i>
									</a>
									</c:if>
								</div>
							</div>		
						</c:forEach>
				
					<div class="d-flex">
						<div class="comment-box w-100 d-flex align-items-center" >
							<div>${userName }</div>
							<input type="text" class="form-control" id="commentInput-${community.id }" style="border:none" placeholder="댓글 달기...">
							<button class="btn btn-link btn-sm commentBtn" data-post-id="${community.id }">게시</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<div class="modal fade" id="PostModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-body text-center">
	        <a href="/post/update_view?id=${community.id }" id="postModifyBtn">수정 하기</a>
			<hr>
	        <a href="#" id="postDeleteBtn">삭제 하기</a>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="CommentdeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-body text-center">
	        <a href="#" id="commentDeleteBtn">삭제 하기</a>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<script>
	
	function processSympathy(postId) {
		$.ajax({
			type:"get",
			url:"/post/sympathy",
			data:{"postId":postId},
			success:function(data) {
				if(data.sympathy){
					$("#heartIcon-" + postId).removeClass("bi-suit-heart");
					$("#heartIcon-" + postId).addClass("bi-suit-heart-fill");
					
					$("#heartIcon-" + postId).removeClass("text-dark");
					$("#heartIcon-" + postId).addClass("heartIconFill");
				} else {
					$("#heartIcon-" + postId).addClass("bi-suit-heart");
					$("#heartIcon-" + postId).removeClass("bi-suit-heart-fill");
					
					$("#heartIcon-" + postId).addClass("text-dark");
					$("#heartIcon-" + postId).removeClass("heartIconFill");
				}
				
				location.reload();
			}
		});
		
	}

			$(document).ready(function(){
				$(".sympathyBtn").on("click", function(e){
					e.preventDefault();
					var postId = $(this).data("post-id");
					
					processSympathy(postId);
				});
				
				$(".imageClick").on("dblclick", function(e){
					e.preventDefault();
					var postId = $(this).data("post-id");
					
					processSympathy(postId);
				});
			
			$(".commentBtn").on("click", function(){
				var postId = $(this).data("post-id");
				var comment = $("#commentInput-" + postId).val();

				
				if(comment == null || comment == "") {
					alert("댓글을 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post",
					url:"/post/create_comment",
					data:{"postId":postId, "comment":comment},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 작성 실패");
						}
					},
					error:function(e) {
						alert("error");
					}	
				});
			});
			
			$(".moreCommentBtn").on("click", function(){
				var commentId = $(this).data("comment-id");
				$("#commentDeleteBtn").data("comment-id", commentId);	
			});
			
			$("#commentDeleteBtn").on("click", function(e){
				e.preventDefault();
				var commentId = $(this).data("comment-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete_comment",
					data:{"commentId":commentId}, 
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("실패");
						}
					},
					error:function(e) {
						alert("error");
					}	
					
				});
			});
			
			$(".morePostBtn").on("click", function(){
				var postId = $(this).data("post-id");
				$("#postDeleteBtn").data("post-id", postId);
				
			});
			
			$("#postDeleteBtn").on("click", function(e){
				e.preventDefault();
				
				var postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete_post",
					data:{"postId":postId}, 
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/main";
						} else {
							alert("실패");
						}
					},
					error:function(e) {
						alert("error" + e);
					}	
				});
			});

		});
	
	</script>
</body>
</html>