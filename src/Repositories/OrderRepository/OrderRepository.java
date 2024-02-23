package Repositories.OrderRepository;

import Data.interfaces.IDB;
import Entities.Order;
import Repositories.OrderRepository.interfaces.IOrderRepository;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class OrderRepository implements IOrderRepository {

    private final IDB db;

    public OrderRepository(IDB db) {
        this.db = db;
    }

    @Override
    public List<Order> getAllOrders(int userId) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "SELECT t.id as ticketId, u.username, m.title, m.description " +
                    "FROM tickets t " +
                    "JOIN users u ON t.userId = u.id " +
                    "JOIN movies m ON t.movieId = m.id " +
                    "WHERE u.id = ?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, userId);

            ResultSet rs = st.executeQuery();
            List<Order> orders = new LinkedList<>();
            while (rs.next()) {
                Order order = new Order(
                        rs.getInt("ticketId"),
                        rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("description")
                );

                orders.add(order);
            }

            return orders;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

}
