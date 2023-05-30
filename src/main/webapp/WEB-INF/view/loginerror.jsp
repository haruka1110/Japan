<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ログインエラー</title>
</head>
<body>
<h1>アカウントが見つかりません</h1>
<form action="<%=request.getContextPath()%>/Login" method="get">
        <div>
            <input type="submit" value="戻る">
        </div>
    </form>
    
    <form action="<%=request.getContextPath()%>/AccountCreate" method="get">
        <div>
            <input type="submit" value="アカウント作成">
        </div>
    </form>
</body>
</html>