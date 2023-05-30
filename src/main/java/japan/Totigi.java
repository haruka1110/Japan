package japan;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Totigi
 */
@WebServlet("/Totigi")
public class Totigi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        if (username != null) {
            // ログイン済みの処理
            request.getRequestDispatcher("WEB-INF/view/totigi.jsp").forward(request, response);
        } else {
            // ログインしていない場合の処理（ログインページにリダイレクト）
        	request.getRequestDispatcher("WEB-INF/view/login.jsp").forward(request, response);
        }
    }
}
