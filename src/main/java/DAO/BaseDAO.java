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

            if (jdbUrl == null || dbUser == null || dbPassword == null) {
                throw new IllegalStateException("Database credentials are not set. Check your .env configuration.");
            }

            conn = DriverManager.getConnection(jdbUrl, dbUser, dbPassword);
            System.out.println("Database connection established successfully.");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found. Include it in your library path.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Failed to establish a database connection. Check the connection parameters.");
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Unexpected error occurred while establishing database connection.");
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
