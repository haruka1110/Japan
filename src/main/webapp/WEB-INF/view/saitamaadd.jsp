<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>埼玉県に写真を追加</title>
<style>
header {
	width: 100%;
	text-align: center;
}

main {
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
<header>
<h1><%= session.getAttribute("username") %>さん</h1>
	<form action="<%=request.getContextPath()%>/Saitamalist" method="get">
		<input type="submit" value="戻る">
	</form>
</header>
<main>
	<form action="<%=request.getContextPath()%>/Saitamaadd" method="post"
		enctype="multipart/form-data">
		<label for="date">日付:</label> <input type="date" name="date" id="date"
			required><br> <br> <label for="location">場所:</label>
		<h4>埼玉県に写真を追加します</h4>
		<input type="hidden" name="location" value="埼玉県">
		<!-- 隠しフィールドとしてlocationを追加 -->
		<br> <label for="photo">写真:</label> <input type="file"
			name="photo" id="photo" required><br> <br>
		<%-- セッションのユーザー名を hidden フィールドに設定 --%>
		<input type="hidden" name="username"
			value="<%=session.getAttribute("username")%>"> <input
			type="submit" value="送信">
	</form>
</main>
</body>
</html>