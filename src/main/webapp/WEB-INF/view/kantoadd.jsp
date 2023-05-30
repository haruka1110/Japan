<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>関東に写真を追加</title>
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
		<form action="<%=request.getContextPath()%>/Kantolist" method="get">
			<input type="submit" value="戻る">
		</form>
	</header>
	<main>
		<form action="<%=request.getContextPath()%>/Kantoadd" method="post"
			enctype="multipart/form-data">
			<label for="date">日付:</label> <input type="date" name="date"
				id="date" required><br> <br> <label for="location">場所:</label>
			<select name="location" required>
				<option value="" disabled selected>都道府県を選択してください</option>
				<option value="茨城県">茨城県</option>
				<option value="栃木県">栃木県</option>
				<option value="群馬県">群馬県</option>
				<option value="埼玉県">埼玉県</option>
				<option value="千葉県">千葉県</option>
				<option value="東京都">東京都</option>
				<option value="神奈川県">神奈川県</option>
			</select> <br> <label for="photo">写真:</label> <input type="file"
				name="photo" id="photo" required><br> <br>
			<%-- セッションのユーザー名を hidden フィールドに設定 --%>
			<input type="hidden" name="username"
				value="<%=session.getAttribute("username")%>"> <input
				type="submit" value="送信">
		</form>
	</main>
</body>
</html>