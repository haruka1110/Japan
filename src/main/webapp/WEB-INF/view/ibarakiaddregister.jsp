<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>保存完了</title>
<style>
div {
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<h1>保存しました</h1>
		<a href="<%=request.getContextPath()%>/Ibarakiadd">続けて保存する</a> <a
			href="<%=request.getContextPath()%>/Ibarakilist">写真一覧に戻る</a>
	</div>
</body>
</html>