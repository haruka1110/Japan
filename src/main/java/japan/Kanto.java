package japan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Kanto
 */
@WebServlet("/Kanto")
public class Kanto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        if (username != null) {
            // ログイン済みの処理
            request.getRequestDispatcher("WEB-INF/view/kanto.jsp").forward(request, response);
        } else {
            // ログインしていない場合の処理（ログインページにリダイレクト）
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }
}
