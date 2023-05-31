package japan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String url = "jdbc:mysql://localhost:3306/album";
    private String username = "root";
    private String password = "Mypass#9999";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 文字化け防止
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // パスワードの条件をチェック
        if (!isValidPassword(password)) {
            
            return;
        }

        // データベース接続用の変数
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // データベースに接続
            conn = DriverManager.getConnection(url, this.username, this.password);

            // SQL文を準備
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            // クエリを実行して結果を取得
            rs = stmt.executeQuery();

            if (rs.next()) {
                // ログイン成功
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                request.getRequestDispatcher("WEB-INF/view/japan.jsp").forward(request, response);
            } else {
                // ログイン失敗時の処理（エラーメッセージなど）
                request.getRequestDispatcher("WEB-INF/view/loginerror.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            // データベース接続エラーの処理
            e.printStackTrace();
            // エラーページにリダイレクトなど、適切なエラーハンドリングを行う
            request.getRequestDispatcher("WEB-INF/view/loginerror.jsp").forward(request, response);
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

    // パスワードの条件をチェックするメソッド
    private boolean isValidPassword(String password) {
        // パスワードの正規表現パターン
        String pattern =  "^(?=.*[a-zA-Z])(?=.*\\d).{5,}$";
        return Pattern.matches(pattern, password);
    }
}
