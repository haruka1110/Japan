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
	.item10, .item11, .item12, .item13, .item14, .item15, .item16, .item17,
	.item18, .item19, .item20 {
	background-color: #0084ff;
}

.item1 {
	grid-column-start: 8;
	grid-column-end: 9;
	grid-row-start: 1;
	grid-row-end: 2;
}

.item2 {
	grid-column-start: 12;
	grid-column-end: 14;
	grid-row-start: 1;
	grid-row-end: 2;
}

.item3 {
	grid-column-start: 8;
	grid-column-end: 10;
	grid-row-start: 2;
	grid-row-end: 3;
}

.item4 {
	grid-column-start: 11;
	grid-column-end: 14;
	grid-row-start: 2;
	grid-row-end: 3;
}

.item5 {
	grid-column-start: 8;
	grid-column-end: 14;
	grid-row-start: 3;
	grid-row-end: 4;
}

.item6 {
	grid-column-start: 8;
	grid-column-end: 14;
	grid-row-start: 4;
	grid-row-end: 5;
}

.item7 {
	grid-column-start: 8;
	grid-column-end: 13;
	grid-row-start: 5;
	grid-row-end: 6;
}

.item8 {
	grid-column-start: 8;
	grid-column-end: 13;
	grid-row-start: 6;
	grid-row-end: 7;
}

.item9 {
	grid-column-start: 8;
	grid-column-end: 13;
	grid-row-start: 6;
	grid-row-end: 7;
}

.item10 {
	grid-column-start: 6;
	grid-column-end: 13;
	grid-row-start: 7;
	grid-row-end: 8;
}

.item11 {
	grid-column-start: 5;
	grid-column-end: 13;
	grid-row-start: 8;
	grid-row-end: 9;
}

.item12 {
	grid-column-start: 4;
	grid-column-end: 12;
	grid-row-start: 9;
	grid-row-end: 10;
}

.item13 {
	grid-column-start: 3;
	grid-column-end: 13;
	grid-row-start: 10;
	grid-row-end: 11;
}

.item14 {
	grid-column-start: 3;
	grid-column-end: 10;
	grid-row-start: 11;
	grid-row-end: 12;
}

.item15 {
	grid-column-start: 11;
	grid-column-end: 13;
	grid-row-start: 11;
	grid-row-end: 12;
}

.item16 {
	grid-column-start: 4;
	grid-column-end: 9;
	grid-row-start: 12;
	grid-row-end: 13;
}

.item17 {
	grid-column-start: 11;
	grid-column-end: 13;
	grid-row-start: 12;
	grid-row-end: 13;
}

.item18 {
	grid-column-start: 5;
	grid-column-end: 14;
	grid-row-start: 13;
	grid-row-end: 14;
}

.item19 {
	grid-column-start: 6;
	grid-column-end: 11;
	grid-row-start: 14;
	grid-row-end: 15;
}

.item20 {
	grid-column-start: 13;
	grid-column-end: 15;
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
		<h1>茨城県</h1>
		<h1><%=session.getAttribute("username")%>さん
		</h1>
		<div class="headernav">
		    <form action="<%=request.getContextPath()%>/Ibarakilist" method="get">
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
		<div class="item12"></div>
		<div class="item13"></div>
		<div class="item14"></div>
		<div class="item15"></div>
		<div class="item16"></div>
		<div class="item17"></div>
		<div class="item18"></div>
		<div class="item19"></div>
		<div class="item20"></div>
	</div>

</body>
</html>