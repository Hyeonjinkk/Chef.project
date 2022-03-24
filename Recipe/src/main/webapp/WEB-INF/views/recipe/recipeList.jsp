<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	
</script>
<div align="center">
	<c:forEach items="${recipes}" var="recipe">
		<div>
			<a href="#"><img src="${recipe.RImageSm}"></a>
			<div>
				<button type="button">${recipe.RName}</button>
			</div>
		</div>
	</c:forEach>
</div>
