<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>日本</title>
<style>
.container {
	display: grid;
	width: 60%;
	height: 600px;
	margin: 0 auto;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
	grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
}

.hokkaido, .tohoku, .kanto, .tyubu, .kinki, .tyugoku, .sikoku, .kyusyu,
	.okinawa {
	border: 1px solid black;
	position: relative;
	overflow: hidden;
	cursor: pointer;
	/* カーソルをポインターに変更 */
}

.hokkaido:hover .hokkaidotext p, .tohoku:hover .tohokutext p, .kanto:hover .kantotext p,
	.tyubu:hover .tyubutext p, .kinki:hover .kinkitext p, .tyugoku:hover .tyugokutext p,
	.sikoku:hover .sikokutext p, .kyusyu:hover .kyusyutext p, .okinawa:hover .okinawatext p
	{
	display: block;
}

.hokkaido p, .tohoku p, .kanto p, .tyubu p, .kinki p, .tyugoku p,
	.sikoku p, .kyusyu p, .okinawa p {
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

.hokkaido {
	grid-column-start: 10;
	grid-column-end: 13;
	grid-row-start: 1;
	grid-row-end: 4;
	background-color: #0000ff;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
	/* 影の設定 */
}

.hokkaido:hover {
	transform: translateY(-4px);
}

.tohoku {
	grid-column-start: 10;
	grid-column-end: 13;
	grid-row-start: 5;
	grid-row-end: 8;
	background-color: #0084ff;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
	/* 影の設定 */
}

.tohoku:hover {
	transform: translateY(-4px);
}

.kanto {
	grid-column-start: 10;
	grid-column-end: 13;
	grid-row-start: 8;
	grid-row-end: 11;
	background-color: #00ffea;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
	/* 影の設定 */
}

.kanto:hover {
	transform: translateY(-4px);
}

.tyubu {
	grid-column-start: 8;
	grid-column-end: 10;
	grid-row-start: 7;
	grid-row-end: 11;
	background-color: #00ff37;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
	/* 影の設定 */
}

.tyubu:hover {
	transform: translateY(-4px);
}

.kinki {
	grid-column-start: 6;
	grid-column-end: 8;
	grid-row-start: 8;
	grid-row-end: 12;
	background-color: #91ff00;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
	/* 影の設定 */
}

.kinki:hover {
	transform: translateY(-4px);
}

.tyugoku {
	grid-column-start: 3;
	grid-column-end: 6;
	grid-row-start: 8;
	grid-row-end: 10;
	background-color: #fffb00;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
	/* 影の設定 */
}

.tyugoku:hover {
	transform: translateY(-4px);
}

.sikoku {
	grid-column-start: 3;
	grid-column-end: 6;
	grid-row-start: 11;
	grid-row-end: 12;
	background-color: #ffbb00;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
	/* 影の設定 */
}

.sikoku:hover {
	transform: translateY(-4px);
}

.kyusyu {
	grid-column-start: 1;
	grid-column-end: 3;
	grid-row-start: 9;
	grid-row-end: 113;
	background-color: #ff6600;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
	/* 影の設定 */
}

.kyusyu:hover {
	transform: translateY(-4px);
}

.okinawa {
	grid-column-start: 4;
	grid-column-end: 5;
	grid-row-start: 4;
	grid-row-end: 5;
	background-color: #ff0000;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
	/* 影の設定 */
}

.okinawa:hover {
	transform: translateY(-4px);
}

.okinawaline1 {
	border-right: 1px solid black;
	grid-column-start: 5;
	grid-column-end: 5;
	grid-row-start: 4;
	grid-row-end: 4;
}

.okinawaline2 {
	border-right: 1px solid black;
	grid-column-start: 5;
	grid-column-end: 5;
	grid-row-start: 5;
}

.okinawaline3 {
	border-bottom: 1px solid #000;
	grid-column-start: 4;
	grid-row-start: 5;
}

.okinawaline4 {
	border-bottom: 1px solid #000;
	grid-column-start: 5;
	grid-row-start: 5;
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
<script>
	// 各県の要素がクリックされた際の処理
	function redirectToLink(servletPath) {
		window.location.href = servletPath;
	}
</script>
</head>

<body>
		<header>
			<h1>日本</h1>
			<h1>
				<%=session.getAttribute("username")%>さん
			</h1>
			<div class="headernav">
				<form action="<%=request.getContextPath()%>/Japanlist" method="get">
					<input type="submit" value="写真一覧" class="nav">
				</form>
				<form action="<%=request.getContextPath()%>/Logout" method="get">
					<input type="submit" value="ログアウトする" class="nav">
				</form>
			</div>
		</header>
		<div class="container">
			<div class="hokkaido"
				onclick="redirectToLink('<%=request.getContextPath()%>/Hokkaido')">
				<div class="hokkaidotext">
					<p>北海道</p>
				</div>
			</div>
			<div class="tohoku"
				onclick="redirectToLink('<%=request.getContextPath()%>/Tohoku')">
				<div class="tohokutext">
					<p>東北</p>
				</div>
			</div>
			<div class="kanto"
				onclick="redirectToLink('<%=request.getContextPath()%>/Kanto')">
				<div class="kantotext">
					<p>関東</p>
				</div>
			</div>
			<div class="tyubu"
				onclick="redirectToLink('<%=request.getContextPath()%>/Tyubu')">
				<div class="tyubutext">
					<p>中部</p>
				</div>
			</div>
			<div class="kinki"
				onclick="redirectToLink('<%=request.getContextPath()%>/Kinki')">
				<div class="kinkitext">
					<p>近畿</p>
				</div>
			</div>
			<div class="tyugoku"
				onclick="redirectToLink('<%=request.getContextPath()%>/Tyugoku')">
				<div class="tyugokutext">
					<p>中国</p>
				</div>
			</div>
			<div class="sikoku"
				onclick="redirectToLink('<%=request.getContextPath()%>/Sikoku')">
				<div class="sikokutext">
					<p>四国</p>
				</div>
			</div>
			<div class="kyusyu"
				onclick="redirectToLink('<%=request.getContextPath()%>/Kyusyu')">
				<div class="kyusyutext">
					<p>九州</p>
				</div>
			</div>
			<div class="okinawa"
				onclick="redirectToLink('<%=request.getContextPath()%>/Okinawa')">
				<div class="okinawatext">
					<p>沖縄</p>
				</div>
			</div>
			<div class="okinawaline1"></div>
			<div class="okinawaline2"></div>
			<div class="okinawaline3"></div>
			<div class="okinawaline4"></div>

		</div>
</body>

</html>