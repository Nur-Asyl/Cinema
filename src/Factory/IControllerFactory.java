package Factory;

import Controllers.MovieController.MovieController;
import Controllers.TicketController.TicketController;
import Controllers.UserController.UserController;

public interface IControllerFactory {
    MovieController createMovieController();
    UserController createUserController();
    TicketController createTicketController();
}
