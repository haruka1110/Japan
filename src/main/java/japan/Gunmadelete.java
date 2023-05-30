package japan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Gunmadelete
 */
@WebServlet("/Gunmadelete")
public class Gunmadelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/album";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Mypass#9999";


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
            String sql = "DELETE FROM photos WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // エラー処理
        }

        response.sendRedirect(request.getContextPath() + "/Gunmalist");
    }
}
