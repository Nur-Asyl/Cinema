package Cinema.Menu;

import Controllers.MovieController.MovieController;
import Controllers.OrderController.OrderController;
import Controllers.UserController.UserController;
import Controllers.TicketController.TicketController;
import Cinema.Menu.ManagementMenu.MovieMenu;
import Cinema.Menu.ManagementMenu.UserMenu;
import Cinema.Menu.ManagementMenu.TicketMenu;

import java.util.InputMismatchException;
import java.util.Scanner;

public class AdminMenu {
    private final MovieController movieController;
    private final UserController userController;
    private final TicketController ticketController;
    private final OrderController orderController;
    private final Scanner scanner;
    private final UserMenu userMenu;
    private final MovieMenu movieMenu;
    private final TicketMenu ticketMenu;

    public AdminMenu(UserController userController, MovieController movieController, TicketController ticketController, OrderController orderController, Scanner scanner) {
        this.userController = userController;
        this.movieController = movieController;
        this.ticketController = ticketController;
        this.orderController = orderController;
        this.scanner = scanner;
        userMenu = new UserMenu(userController, this.scanner);
        movieMenu = new MovieMenu(movieController, this.scanner);
        ticketMenu = new TicketMenu(ticketController, orderController, this.scanner);
    }

    public void start() {
        int option = 0;
        while (true) {
            System.out.println();
            System.out.println("**********************************");
            System.out.println("---------SYSTEM--------");
            System.out.println("Select option:");
            System.out.println("1. Manage movies");
            System.out.println("2. Manage users");
            System.out.println("3. Manage tickets");
            System.out.println("0. Back");
            System.out.println();

            try {
                System.out.print("Enter option (1-3): ");
                option = scanner.nextInt();
                switch (option) {
                    case 1:
                        movieMenu.start();
                        break;
                    case 2:
                        userMenu.start();
                        break;
                    case 3:
                        ticketMenu.start();
                        break;
                    default:
                        return;
                }
            } catch (InputMismatchException e) {
                System.out.println(e.getMessage() + ": Input must be an integer");
                scanner.nextLine(); // to ignore incorrect input
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

            System.out.println("**********************************");
        }
    }
}
