<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<head>

<style>
th {
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
}

td {
	text-align: center;
	border-bottom: 1px solid gray;
}
</style>
</head>

<body>
	<div align="center">
		<table>
			<thead>
				<label><h1>레시피</h1></label>
			</thead>
			<tbody>
				<tr>
					<th width="150px">일련번호</th>
					<th width="200px" colspan="2">제목</th>
					<th width="100px">작성자</th>
					<th width="100px">등록일자</th>
				</tr>
				<c:forEach items="${recipes }" var="list" >
				<tr>
					<td>${list.RSeq }</td>
					<td><img
						src=${list.RImageSm }
						width="130px" height="100px"></td>
					<td width="350px">${list.RName }</td>
					<c:if test="${list.userNo eq 1 }">
					<td>ADMIN</td>
					</c:if>
					<td>${list.RDate }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>




























<%-- <c:forEach items="${recipes}" var="recipe">
		<div>
			<a href="#"><img src="${recipe.RImageSm}"></a>
			<div>
				<button type="button">${recipe.RName} ${recipe.RDate}</button>
			</div>
		</div>
	</c:forEach> --%>
