<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<style>
	header {
	font-family: 'Cafe24SsurroundAir';
		}
</style>
<header>
	<div class="h-100 d-flex justify-content-between p-2">
 		<div></div>
 		
		<a href="/post/main"><img src="/image/logo.jpg" class="logo-size2"></a>	

		<div class="dropdown"> 
			 <c:if test="${not empty userName}">
				<button class="btn dropdown-toggle font-weight-bold" data-toggle="dropdown"> 
					<img src="/image/profil.jpg" class="headerprofil-size">
					${userName }
				</button> 
			</c:if>
			<div class="dropdown-menu"> 
				<a class="dropdown-item"  href="/user/sign_out">로그아웃</a> 
			</div> 		
		</div>
	</div>
</header>

