import Controllers.MovieController.MovieController;
import Controllers.OrderController.OrderController;
import Controllers.TicketController.TicketController;
import Controllers.UserController.UserController;
import Data.PostgresDB;
import Data.interfaces.IDB;
import Entities.Order;
import Factory.ControllerFactory;
import Cinema.Application;

import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {

        IDB db = PostgresDB.getInstance();
        db.getConnection();

        ControllerFactory controllerFactory = new ControllerFactory(db);
        UserController userController = controllerFactory.createUserController();

        MovieController movieController = controllerFactory.createMovieController();

        TicketController ticketController = controllerFactory.createTicketController();

        OrderController orderController = controllerFactory.createOrderController();

        Application app = new Application(userController, movieController, ticketController, orderController);
        app.start();
    }
}