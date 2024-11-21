package DAO;

import io.github.cdimascio.dotenv.Dotenv;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDAO {
    /**
     * STARTS THE CONNECTION
     */
    protected Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            /** SET PASSWORD HERE */
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alice_in_borderland", "root", "");

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
