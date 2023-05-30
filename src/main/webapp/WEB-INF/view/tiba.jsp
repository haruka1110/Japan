<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	display: grid;
	width: 60%;
	height: 600px;
	margin: 0 auto;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr
		1fr 1fr 1fr 1fr;
	grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr
		1fr 1fr 1fr;
}

.gunma1, .gunma2, .gunma3, .gunma4, .gunma5, .gunma6, .gunma7, .gunma8,
	.gunma9, .gunma10, .gunma11 ,.gunma12{
	background-color: #0059ff;
}

.gunma1 {
	grid-column-start: 6;
	grid-column-end: 7;
	grid-row-start: 4;
	grid-row-end: 5;
}

.gunma2 {
	grid-column-start: 11;
	grid-column-end: 12;
	grid-row-start: 4;
	grid-row-end: 5;
}

.gunma3 {
	grid-column-start: 6;
	grid-column-end: 13;
	grid-row-start: 5;
	grid-row-end: 6;
}

.gunma4 {
	grid-column-start: 7;
	grid-column-end: 14;
	grid-row-start: 6;
	grid-row-end: 7;
}

.gunma5 {
	grid-column-start: 7;
	grid-column-end: 12;
	grid-row-start: 7;
	grid-row-end: 8;
}

.gunma6 {
	grid-column-start: 8;
	grid-column-end: 11;
	grid-row-start: 8;
	grid-row-end: 9;
}

.gunma7 {
	grid-column-start: 7;
	grid-column-end: 11;
	grid-row-start: 9;
	grid-row-end: 10;
}

.gunma8 {
	grid-column-start: 6;
	grid-column-end: 11;
	grid-row-start: 10;
	grid-row-end: 11;
}

.gunma9 {
	grid-column-start: 6;
	grid-column-end: 10;
	grid-row-start: 11;
	grid-row-end: 12;
}

.gunma10 {
	grid-column-start: 6;
	grid-column-end: 10;
	grid-row-start: 12;
	grid-row-end: 13;
}

.gunma11 {
	grid-column-start: 6;
	grid-column-end: 7;
	grid-row-start: 13;
	grid-row-end: 14;
}

.gunma12{
    grid-column-start: 5;
	grid-column-end: 7;
	grid-row-start: 14;
	grid-row-end: 15;
}

header {
	margin-bottom: 20px;
}

.headernav {
	display: flex;
	justify-content: space-around;
}

.nav {
	width: 300px;
}
</style>
</head>
<body>
	<header>
		<h1>千葉県</h1>
		<h1><%=session.getAttribute("username")%>さん
		</h1>
		<div class="headernav">
			<form action="<%=request.getContextPath()%>/Kanto" method="get">
				<input type="submit" value="戻る" class="nav">
			</form>
			<form action="<%=request.getContextPath()%>/Tibalist" method="get">
				<input type="submit" value="写真一覧" class="nav">
			</form>
			<form action="<%=request.getContextPath()%>/Logout" method="get">
				<input type="submit" value="ログアウトする" class="nav">
			</form>
		</div>
	</header>
	<div class="container">
		<div class="gunma1"></div>
		<div class="gunma2"></div>
		<div class="gunma3"></div>
		<div class="gunma4"></div>
		<div class="gunma5"></div>
		<div class="gunma6"></div>
		<div class="gunma7"></div>
		<div class="gunma8"></div>
		<div class="gunma9"></div>
		<div class="gunma10"></div>
		<div class="gunma11"></div>
        <div class="gunma12"></div>
	</div>
</body>
</html>