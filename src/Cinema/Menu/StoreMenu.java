package Cinema.Menu;

import Controllers.TicketController.TicketController;
import Controllers.UserController.UserController;
import Controllers.MovieController.MovieController;

import java.util.InputMismatchException;
import java.util.Scanner;

public class StoreMenu {
    private final Scanner sc;
    private final UserController userController;
    private final TicketController ticketController;
    private final MovieController movieController;

    public StoreMenu(UserController userController, TicketController ticketController, Scanner sc, MovieController movieController) {
        this.sc = sc;
        this.userController = userController;
        this.ticketController = ticketController;
        this.movieController = movieController;
    }

    public void start(int userId){
        System.out.println("\nSelect option:");
        System.out.println("1. Choose Movie");
        System.out.println("0. Back");
        System.out.print("Option: ");
        try {
            int option = sc.nextInt();
            switch(option) {
                case 1:
                    chooseMovie(userId);
                    break;
                default:
                    break;
            }
        } catch (InputMismatchException e){
            System.out.println(e.getMessage() + ": Input must be integer");
            sc.nextLine(); // Consume the invalid input
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    public void chooseMovie(int userId) {
        try {
            System.out.println("Available Movies:");
            System.out.println(movieController.getAllMovies());

            System.out.print("Enter movie ID: ");
            int movieId = sc.nextInt();

            if (movieController.getMovie(movieId) != null) {
                ticketController.createTicket(userId, movieId);
                System.out.println("Ticket purchased successfully!");
            } else {
                System.out.println("Invalid movie ID. Please select a valid movie.");
            }
        } catch (InputMismatchException e) {
            System.out.println("Invalid input. Please enter a valid movie ID.");
            sc.nextLine();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
