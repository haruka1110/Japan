package japan;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Japanadd
 */
@WebServlet("/Japanadd")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class Japanadd extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            // ログインしていない場合はログインページにリダイレクトするなどの処理を行う
            response.sendRedirect("login.jsp");
        } else {
            request.getRequestDispatcher("WEB-INF/view/japanadd.jsp").forward(request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            // ログインしていない場合はログインページにリダイレクトするなどの処理を行う
            response.sendRedirect("login.jsp");
            return;
        }

        // 文字化け防止
        request.setCharacterEncoding("UTF-8");

        Part filePart = request.getPart("photo");
        String date = request.getParameter("date");
        String location = request.getParameter("location");

        // ファイルのバイナリデータを取得
        InputStream inputStream = filePart.getInputStream();
        byte[] photoData = inputStream.readAllBytes();

        // 写真をリサイズ
        photoData = resizePhoto(photoData, 1024, 1024);

        // データベースへの接続情報
        String url = "jdbc:mysql://localhost:3306/album";
        String dbUsername = "root";
        String dbPassword = "Mypass#9999";

        try (Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword)) {
            // データベースへの保存
            String query = "INSERT INTO photos (username, date, location, photo) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, date);
            statement.setString(3, location);
            statement.setBytes(4, photoData);
            statement.executeUpdate();

            // 保存が完了
            request.getRequestDispatcher("WEB-INF/view/japanaddregister.jsp").forward(request, response);
        } catch (SQLException e) {
            // エラー処理
            e.printStackTrace();
            response.getWriter().println("写真のアップロードに失敗しました。");
        }
    }

    private byte[] resizePhoto(byte[] photoData, int width, int height) throws IOException {
        ByteArrayInputStream bis = new ByteArrayInputStream(photoData);
        BufferedImage image = ImageIO.read(bis);
        Image resizedImage = image.getScaledInstance(width, height, Image.SCALE_SMOOTH);

        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        bufferedImage.getGraphics().drawImage(resizedImage, 0, 0, null);

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(bufferedImage, "jpg", baos);
        return baos.toByteArray();
    }
}
