package japan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Japanlist")
public class Japanlist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// セッションからユーザー名を取得
		String username = (String) request.getSession().getAttribute("username");

		// データベースから写真データを取得
		List<Photo> photoList = new ArrayList<>();
		String url = "jdbc:mysql://localhost:3306/album";
		String dbUsername = "root";
		String dbPassword = "Mypass#9999";

		try (Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword)) {
			String query = "SELECT * FROM photos WHERE username = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, username);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String date = resultSet.getString("date");
				String location = resultSet.getString("location");
				byte[] photoData = resultSet.getBytes("photo");

				photoList.add(new Photo(id, date, location, photoData));
			}

			resultSet.close();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
			// エラー処理
		}

		// 取得した写真データをリクエスト属性に設定
		request.setAttribute("photoList", photoList);

		// jspにフォワード
		request.getRequestDispatcher("WEB-INF/view/japanlist.jsp").forward(request, response);
	}

}
