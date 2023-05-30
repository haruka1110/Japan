package japan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AccountCreate")
public class AccountCreate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String url = "jdbc:mysql://localhost:3306/album";
    private String username = "root";
    private String password = "Mypass#9999";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/accountCreate.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // データベース接続用の変数
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // データベースに接続
            conn = DriverManager.getConnection(url, this.username, this.password);

            // 既に同じユーザー名が存在するかチェック
            String checkSql = "SELECT * FROM users WHERE username = ?";
            stmt = conn.prepareStatement(checkSql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // 既に同じユーザー名が存在する場合、エラーメッセージを表示してアカウント作成ページにリダイレクト
                request.setAttribute("error", "そのユーザー名は既にあります");
                request.getRequestDispatcher("WEB-INF/view/accountCreate.jsp").forward(request, response);
            } else if (!isPasswordValid(password)) {
                // パスワードが条件を満たさない場合、エラーメッセージを表示してアカウント作成ページにリダイレクト
                request.setAttribute("error", "パスワードはローマ字、数字、5文字以上で入力してください");
                request.getRequestDispatcher("WEB-INF/view/accountCreate.jsp").forward(request, response);
            } else {
                // 同じユーザー名が存在せず、パスワードの条件も満たす場合、アカウントを作成
                String insertSql = "INSERT INTO users (username, password) VALUES (?, ?)";
                stmt = conn.prepareStatement(insertSql);
                stmt.setString(1, username);
                stmt.setString(2, password);
                stmt.executeUpdate();

                // アカウント作成成功の場合、ログインページにリダイレクト
                request.getRequestDispatcher("WEB-INF/view/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            // データベース接続エラーの処理
            e.printStackTrace();
            // エラーページにリダイレクトなど、適切なエラーハンドリングを行う
        } finally {
            // 接続を閉じる
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    private boolean isPasswordValid(String password) {
    	// パスワードの条件を定義
    	String regex = "^(?=.*[a-zA-Z])(?=.*\\d).{5,}$";
        // パスワードが条件を満たすかチェック
        return password.matches(regex);
    }
}
