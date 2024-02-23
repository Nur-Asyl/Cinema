package Data;

import Data.interfaces.IDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PostgresDB implements IDB {

    private static PostgresDB instance = null; // static instance variable

    private PostgresDB() {} // private constructor to prevent instantiation

    public static PostgresDB getInstance() {
        if (instance == null) {
            instance = new PostgresDB();
        }
        return instance;
    }

    @Override
    public Connection getConnection() throws SQLException, ClassNotFoundException {
        String connectionUrl = "jdbc:postgresql://localhost:5432/cinemaSystem";
        try {
            Class.forName("org.postgresql.Driver");

            Connection con = DriverManager.getConnection(connectionUrl, "postgres", "root");

            return con;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
