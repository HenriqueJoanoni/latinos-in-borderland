package DAO;

import io.github.cdimascio.dotenv.Dotenv;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDAO {
    private static final Dotenv dotenv = Dotenv.load();

    private final String jdbUrl = dotenv.get("DB_URL");
    private final String dbUser = dotenv.get("DB_USERNAME");
    private final String dbPassword = dotenv.get("DB_PASSWORD");

    /**
     * STARTS THE CONNECTION
     */
    protected Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbUrl, dbUser, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * CLOSE THE CONNECTION
     */
    protected void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
