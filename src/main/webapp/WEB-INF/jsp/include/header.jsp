<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<style>
	header {
	font-family: 'Nanum Gothic Coding', monospace;
		}
</style>
<header>
	<div class="h-100 d-flex justify-content-between p-2">
		<div>
		
		</div>
		
		<c:choose>
			<c:when test="${not empty userId}">
				<a href="/post/main"><img src="/image/logo.jpg" class="logo-size ml-5"></a>	
			</c:when>
			<c:otherwise>
				<a href="/user/signIn_view"><img src="/image/logo.jpg" class="logo-size ml-2"></a>	
			</c:otherwise>
		</c:choose>
		<div class="dropdown"> 
			 <c:if test="${not empty userName}">
				<button class="btn dropdown-toggle font-weight-bold" data-toggle="dropdown"> 
					<img src="/image/profil.jpg" class="headerprofil-size">
					${userName }
				</button> 
			</c:if>
			<div class="dropdown-menu"> 
				<a class="dropdown-item"  href="/user/mypet_view">반려동물 등록하기</a> 
				<a class="dropdown-item"  href="/user/sign_out">로그아웃</a> 
			</div> 
		
		</div> 
	</div>
</header>
<div class="border-top"></div>

<script>


</script>