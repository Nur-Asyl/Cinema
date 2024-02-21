import Controllers.MovieController.MovieController;
import Controllers.TicketController.TicketController;
import Controllers.UserController.UserController;
import Data.PostgresDB;
import Data.interfaces.IDB;
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

        //Data base
        IDB db = PostgresDB.getInstance();
        db.getConnection();

        //Repositories and Controllers
        IUserRepository userRepo = new UserRepository(db);
        UserController userController = new UserController(userRepo);

        IMovieRepository movieRepo = new MovieRepository(db);
        MovieController movieController = new MovieController(movieRepo);

        ITicketRepository ticketRepo = new TicketRepository(db);
        TicketController ticketController = new TicketController(ticketRepo);

        // MarketPlace
        Application app = new Application(userController, movieController, ticketController);
        app.start(); // starting Big boy

    }
}