package Factory;

import Controllers.MovieController.MovieController;
import Controllers.OrderController.OrderController;
import Controllers.TicketController.TicketController;
import Controllers.UserController.UserController;
import Data.interfaces.IDB;
import Repositories.MovieRepository.MovieRepository;
import Repositories.MovieRepository.interfaces.IMovieRepository;
import Repositories.OrderRepository.OrderRepository;
import Repositories.OrderRepository.interfaces.IOrderRepository;
import Repositories.TicketRepository.TicketRepository;
import Repositories.TicketRepository.interfaces.ITicketRepository;
import Repositories.UserRepository.UserRepository;
import Repositories.UserRepository.interfaces.IUserRepository;

public class ControllerFactory implements IControllerFactory {
    private IDB db;
    private IUserRepository userRepo;
    private IMovieRepository movieRepo;
    private ITicketRepository ticketRepo;
    private IOrderRepository orderRepo;

    public ControllerFactory(IDB db) {
        this.db = db;
        userRepo = new UserRepository(db);
        movieRepo = new MovieRepository(db);
        ticketRepo = new TicketRepository(db);
        orderRepo = new OrderRepository(db);
    }

    @Override
    public MovieController createMovieController() {
        return new MovieController(movieRepo);
    }

    @Override
    public UserController createUserController() {
        return new UserController(userRepo);
    }

    @Override
    public TicketController createTicketController() {
        return new TicketController(ticketRepo);
    }
    @Override
    public OrderController createOrderController() {
        return new OrderController(orderRepo);
    }
}
