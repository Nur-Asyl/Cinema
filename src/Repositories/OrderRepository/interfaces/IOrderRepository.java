package Repositories.OrderRepository.interfaces;

import Entities.Order;

import java.util.List;

public interface IOrderRepository {
    public List<Order> getAllOrders(int userId);
}
