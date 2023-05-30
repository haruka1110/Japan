<%@ page pageEncoding="UTF-8"%>
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
	grid-template-columns: 1fr 1fr 1fr;
	grid-template-rows: 1fr 1fr 1fr 1fr 1fr;
}

.totigi, .gunma, .ibaraki, .saitama, .tiba, .tokyo, .kanagawa {
	border: 1px solid black;
}

.item, .totigi, .ibaraki, .saitama, .tiba, .tokyo, .kanagawa {
	position: relative;
	overflow: hidden;
	cursor: pointer; /* カーソルをポインターに変更 */
}

.gunma:hover .gunmatext p, .totigi:hover .totigitext p, .ibaraki:hover .ibarakitext p,
	.saitama:hover .saitamatext p, .tiba:hover .tibatext p, .tokyo:hover .tokyotext p,
	.kanagawa:hover .kanagawatext p {
	display: block;
}

.gunmatext p, .totigitext p, .ibarakitext p, .saitamatext p, .tibatext p,
	.tokyotext p, .kanagawatext p {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	margin: auto;
	width: fit-content;
	height: fit-content;
	padding: 10px;
	text-align: center;
}

.gunma {
	background-color: #0059ff;
	box-shadow: 6px 6px 10px 0px rgba(0, 0, 0, 0.4);
}

.gunma:hover {
	transform: translateY(-4px);
}

.totigi {
	background-color: #006eff;
	box-shadow: 6px 6px 10px 0px rgba(0, 0, 0, 0.4);
}

.totigi:hover {
	transform: translateY(-4px);
}

.ibaraki {
	background-color: #0084ff;
	box-shadow: 6px 6px 10px 0px rgba(0, 0, 0, 0.4);
}

.ibaraki:hover {
	transform: translateY(-4px);
}

.saitama {
	grid-column-start: 1;
	grid-column-end: 3;
	background-color: #00a2ff;
	box-shadow: 6px 6px 10px 0px rgba(0, 0, 0, 0.4);
}

.saitama:hover {
	transform: translateY(-4px);
}

.tiba {
	grid-column-start: 3;
	grid-column-end: 4;
	grid-row-start: 2;
	grid-row-end: 5;
	background-color: #00b7ff;
	box-shadow: 6px 6px 10px 0px rgba(0, 0, 0, 0.4);
}

.tiba:hover {
	transform: translateY(-4px);
}

.container2 {
	grid-column-start: 1;
	grid-column-end: 3;
	grid-row-start: 3;
	grid-row-end: 5;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	grid-template-rows: 1fr 1fr;
}

.tokyo {
	grid-column-start: 1;
	grid-column-end: 4;
	background-color: #00e1ff;
	box-shadow: 6px 6px 10px 0px rgba(0, 0, 0, 0.4);
}

.tokyo:hover {
	transform: translateY(-4px);
}

.kanagawa {
	grid-column-start: 1;
	grid-column-end: 3;
	background-color: #00ffea;
	box-shadow: 6px 6px 10px 0px rgba(0, 0, 0, 0.4);
}

.kanagawa:hover {
	transform: translateY(-4px);
}

header {
	margin-bottom: 20px;
    width: 100%;
}

.headernav {
	display: flex;
	justify-content: space-around;
}

.nav {
	width: 300px;
}
</style>
<script>
	// 各県の要素がクリックされた際の処理
	function redirectToLink(servletPath) {
		window.location.href = servletPath;
	}
</script>
</head>
<body>
	<header>
		<h1>関東</h1>
		<h1><%=session.getAttribute("username")%>さん
	</header>
	</h1>
	<div class="headernav">
		<form action="<%=request.getContextPath()%>/Kantolist" method="get">
			<input type="submit" value="写真一覧"  class="nav">
		</form>
		<form action="<%=request.getContextPath()%>/Japan" method="get">
			<input type="submit" value="戻る"  class="nav">
		</form>
		<form action="<%=request.getContextPath()%>/Logout" method="get">
			<input type="submit" value="ログアウトする"  class="nav">
		</form>
	</div>
	<div class="container">
		<div class="gunma"
			onclick="redirectToLink('<%=request.getContextPath()%>/Gunma')">
			<div class="gunmatext">
				<p>群馬県</p>
			</div>
		</div>
		<div class="totigi"
			onclick="redirectToLink('<%=request.getContextPath()%>/Totigi')">
			<div class="totigitext">
				<p>栃木県</p>
			</div>
		</div>
		<div class="ibaraki"
			onclick="redirectToLink('<%=request.getContextPath()%>/Ibaraki')">
			<div class="ibarakitext">
				<p>茨城県</p>
			</div>
		</div>
		<div class="saitama"
			onclick="redirectToLink('<%=request.getContextPath()%>/Saitama')">
			<div class="saitamatext">
				<p>埼玉県</p>
			</div>
		</div>
		<div class="tiba"
			onclick="redirectToLink('<%=request.getContextPath()%>/Tiba')">
			<div class="tibatext">
				<p>千葉県</p>
			</div>
		</div>
		<div class="container2">
			<div class="tokyo"
				onclick="redirectToLink('<%=request.getContextPath()%>/Tokyo')">
				<div class="tokyotext">
					<p>東京都</p>
				</div>
			</div>
			<div class="kanagawa"
				onclick="redirectToLink('<%=request.getContextPath()%>/Kanagawa')">
				<div class="kanagawatext">
					<p>神奈川県</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
