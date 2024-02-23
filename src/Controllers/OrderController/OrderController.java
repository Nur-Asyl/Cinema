package Controllers.OrderController;

import Entities.Order;
import Repositories.OrderRepository.interfaces.IOrderRepository;

import java.util.List;

public class OrderController {
    private final IOrderRepository orderRepo;

    public OrderController(IOrderRepository orderRepo) {
        this.orderRepo = orderRepo;
    }

    public List<Order> getAllOrders(int userId) {
        return orderRepo.getAllOrders(userId);
    }
}
