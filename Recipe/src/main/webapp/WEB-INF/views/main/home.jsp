<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div align="center">

		<div>
			<h1>This is Our Main Page of website!!!!!</h1>
		</div>


	</div>
</body>
<script type="text/javascript">
	/* 로그인 메세지 */
	if ('${message}' != '') {
		alert('${message}');
		window.location = "home.do";
	}


	if ('${recipeComments}' != '') {
		alert('${recipeComments}');
		if ('${recipe.recipeSeq}' != '') {
			window.location = "recipeView.do?recipeSeq=" + '${recipe.recipeSeq}';
		}
	}
	
</script>
</html>