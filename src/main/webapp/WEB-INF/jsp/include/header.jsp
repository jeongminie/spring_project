<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div class="d-flex justify-content-end">
		<c:if test="${not empty userName}">
			${userName }
		</c:if>
		<i class="bi bi-person"></i>
	</div>
</header>