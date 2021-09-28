<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="d-flex justify-content-between p-2">
	<div class="d-flex">
		<img src="/image/logo.jpg" class="logo-size"> 집사생활
	</div>
	<div class="d-flex justify-content-end">
		<c:if test="${not empty userName}">
			${userName }
		</c:if>
		<i class="bi bi-person"></i>
	</div>
</header>