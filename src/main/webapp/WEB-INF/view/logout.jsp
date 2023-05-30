<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ログアウト</title>
<style>
    header{
        text-align: center;
    }

    .form{
        text-align: center;
    }
</style>
</head>
<body>
<header><h1>ログアウトしますか</h1></header>
<div class="form">
    <form action="<%=request.getContextPath()%>/Logout" method="post">
    		<input type="submit" value="はい">
    	</form>
    	<form action="<%=request.getContextPath()%>/Japan" method="get">
    		<input type="submit" value="いいえ">
    	</form>
</div>
</body>
</html>