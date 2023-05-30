<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>アカウント作成</title>
</head>
<body>
    <h1>アカウント作成</h1>
    <%-- エラーメッセージが存在する場合に表示する --%>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
    <% } %>
    <form action="<%=request.getContextPath()%>/AccountCreate" method="post">
        <div>
            <label for="username">ユーザー名:</label>
            <input type="text" id="username" name="username" required >
        </div>
        <div>
            <label for="password">パスワード:</label>
            <input type="password" id="password" name="password" required  placeholder="ローマ字、数字、5文字以上で入力してください">
        </div>
        <div>
            <input type="submit" value="作成">
        </div>
    </form>
    
    <form action="<%=request.getContextPath()%>/Login">
    <div>
            <input type="submit" value="戻る">
        </div>
    </form>
</body>
</html>
