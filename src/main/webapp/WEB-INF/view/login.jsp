<%@ page pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>ログイン</title>
            </head>
            <style>
                .container {
                    display: grid;
                    margin: 0 auto;
                    grid-template-columns: 1fr 1fr ;
                    grid-template-rows: 1fr 1fr ;
                    width: 100%;
                    height: 100%;
                }

                .login{
                    grid-column-start: 1;
                    grid-column-end: 3;
                    grid-row-start: 1;
                    grid-row-end: 2;
                    text-align: center;
                }
                
                .create{
                    grid-column-start: 1;
                    grid-column-end: 3;
                    grid-row-start: 2;
                    grid-row-end: 3;
                    text-align: center;
                }
            </style>

            <body>
                <div class="container">
                    <div class="login">
                        <h1>ログイン</h1>
                        <%-- エラーメッセージがあれば表示 --%>
                            <c:if test="${param.error == 'true'}">
                                <p style="color: red;">ログイン失敗</p>
                            </c:if>
                            <form action="<%=request.getContextPath()%>/Login" method="post">
                                <div>
                                    <label for="username">ユーザー名:</label>
                                    <input type="text" id="username" name="username" required>
                                </div>
                                <div>
                                    <label for="password">パスワード:</label>
                                    <input type="password" id="password" name="password" required>
                                </div>
                                <div>
                                    <input type="submit" value="ログイン">
                                </div>
                            </form>
                    </div>

                        <div class="create">
                            <h1>アカウント作成</h1>
                            <form action="<%=request.getContextPath()%>/AccountCreate" method="get">
                                <div>
                                    <input type="submit" value="作成">
                                </div>
                            </form>
                        </div>
                </div>
            </body>

            </html>