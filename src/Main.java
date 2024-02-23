import Controllers.MovieController.MovieController;
import Controllers.TicketController.TicketController;
import Controllers.UserController.UserController;
import Data.PostgresDB;
import Data.interfaces.IDB;
import Factory.ControllerFactory;
import MarketPlace.Application;
import Repositories.MovieRepository.MovieRepository;
import Repositories.MovieRepository.interfaces.IMovieRepository;
import Repositories.TicketRepository.TicketRepository;
import Repositories.TicketRepository.interfaces.ITicketRepository;
import Repositories.UserRepository.UserRepository;
import Repositories.UserRepository.interfaces.IUserRepository;

import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {

        IDB db = PostgresDB.getInstance();
        db.getConnection();

        ControllerFactory controllerFactory = new ControllerFactory(db);
        UserController userController = controllerFactory.createUserController();

        MovieController movieController = controllerFactory.createMovieController();

        TicketController ticketController = controllerFactory.createTicketController();

        Application app = new Application(userController, movieController, ticketController);
        app.start();

    }
}