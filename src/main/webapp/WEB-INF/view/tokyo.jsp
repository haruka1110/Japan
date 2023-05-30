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

.item1, .item2, .item3, .item4, .item5, .item6, .item7, .item8, .item9,
	.item10, .item11, .item12, .item13, .item14, .item15, .item16 {
	background-color: #006eff;
}

.item1 {
	grid-column-start: 2;
	grid-column-end: 4;
	grid-row-start: 5;
	grid-row-end: 6;
}

.item2 {
	grid-column-start: 2;
	grid-column-end: 7;
	grid-row-start: 6;
	grid-row-end: 7;
}

.item3 {
	grid-column-start: 2;
	grid-column-end: 8;
	grid-row-start: 6;
	grid-row-end: 7;
}

.item4 {
	grid-column-start: 9;
	grid-column-end: 10;
	grid-row-start: 6;
	grid-row-end: 7;
}

.item5 {
	grid-column-start: 11;
	grid-column-end: 15;
	grid-row-start: 6;
	grid-row-end: 7;
}

.item6 {
	grid-column-start: 3;
	grid-column-end: 15;
	grid-row-start: 7;
	grid-row-end: 8;
}

.item7 {
	grid-column-start: 5;
	grid-column-end: 15;
	grid-row-start: 8;
	grid-row-end: 9;
}

.item8 {
	grid-column-start: 6;
	grid-column-end: 9;
	grid-row-start: 9;
	grid-row-end: 10;
}

.item9 {
	grid-column-start: 12;
	grid-column-end: 15;
	grid-row-start: 9;
	grid-row-end: 10;
}

.item10 {
	grid-column-start: 9;
	grid-column-end: 10;
	grid-row-start: 10;
	grid-row-end: 11;
}

.item11 {
	grid-column-start: 13;
	grid-column-end: 15;
	grid-row-start: 10;
	grid-row-end: 10;
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
		<h1>東京都</h1>
		<h1><%=session.getAttribute("username")%>さん
		</h1>
		<div class="headernav">
		    <form action="<%=request.getContextPath()%>/Tokyolist" method="get">
    			<input type="submit" value="写真一覧" class="nav">
    		</form>
    		<form action="<%=request.getContextPath()%>/Kanto" method="get">
    			<input type="submit" value="戻る" class="nav">
    		</form>
    		<form action="<%=request.getContextPath()%>/Logout" method="get">
    			<input type="submit" value="ログアウトする" class="nav">
    		</form>
		</div>
	</header>
	<div class="container">
		<div class="item1"></div>
		<div class="item2"></div>
		<div class="item3"></div>
		<div class="item4"></div>
		<div class="item5"></div>
		<div class="item6"></div>
		<div class="item7"></div>
		<div class="item8"></div>
		<div class="item9"></div>
		<div class="item10"></div>
		<div class="item11"></div>
	</div>
</body>
</html>