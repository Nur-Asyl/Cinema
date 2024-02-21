package Data.interfaces;

import java.sql.*;

public interface IDB {
    public Connection getConnection() throws SQLException, ClassNotFoundException;
}
