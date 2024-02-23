package Factory;

import Controllers.MovieController.MovieController;
import Controllers.OrderController.OrderController;
import Controllers.TicketController.TicketController;
import Controllers.UserController.UserController;
import Repositories.OrderRepository.OrderRepository;

public interface IControllerFactory {
    MovieController createMovieController();
    UserController createUserController();
    TicketController createTicketController();
    OrderController createOrderController();
}
