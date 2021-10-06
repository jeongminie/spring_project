<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	nav {
	font-family: 'Nanum Gothic Coding', monospace;
		}
</style>

<nav>

	<ul class="nav nav-fill text-dark">	
		<li class="nav-item"><a href="/post/main" class="nav-link font-weight-bold dropdown">커뮤니티</a>
			<ul class="submenu">			
				<li class="font-weight-bold"><a href="/post/category_view?category=일상">일상</a></li>
				<li class="font-weight-bold"><a href="/post/category_view?category=광고">광고</a></li>
				<li class="font-weight-bold"><a href="/post/category_view?category=리뷰">리뷰</a></li>
			</ul>
		</li>
		<li class="nav-item"><a href="/post/daily" class="nav-link font-weight-bold">집사일기</a></li>
		<li class="nav-item"><a href="/user/myPage" class="nav-link font-weight-bold">마이페이지</a></li>
	</ul>
</nav>

