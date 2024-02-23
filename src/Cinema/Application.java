package Cinema;

import Controllers.MovieController.MovieController;
import Controllers.OrderController.OrderController;
import Controllers.TicketController.TicketController;
import Controllers.UserController.UserController;
import Cinema.Menu.AdminMenu;
import Cinema.Menu.CustomerProfileMenu;
import Cinema.Menu.StoreMenu;

import java.util.InputMismatchException;
import java.util.Scanner;


public class Application {

    private final UserController userController;
    private final MovieController movieController;
    private final TicketController ticketController;
    private final OrderController orderController;
    private final Scanner scanner;
    CustomerProfileMenu customerMenu;
    AdminMenu adminMenu;
    StoreMenu storeMenu;

    public Application(UserController userController, MovieController movieController, TicketController ticketController, OrderController orderController) {
        this.userController = userController;
        this.movieController = movieController;
        this.ticketController = ticketController;
        this.orderController = orderController;
        this.scanner = new Scanner(System.in);
        customerMenu = new CustomerProfileMenu(this.userController, this.movieController, this.ticketController, this.orderController, scanner);
        adminMenu = new AdminMenu(this.userController, this.movieController, this.ticketController, this.orderController, scanner);
        storeMenu = new StoreMenu(this.userController, this.ticketController, scanner, this.movieController);
    }

    public void start() {
       int option;
        while (true) {
            try {
                System.out.println("1. Movies");
                System.out.println("2. Profile");
                System.out.println("3. for Admin");
                System.out.println("Option:");
                option = scanner.nextInt();
                if (option == 1) {
                    if(customerMenu.isRegistered()){
                        storeMenu.start(customerMenu.getUserId());
                    } else{
                        System.out.println("|---------|Please log in or sign up|----------|");
                    }
                } else if (option == 2) {
                    customerMenu.start();
                } else if (option == 3) {
                    adminMenu.start();
                } else {
                    this.scanner.close();
                    break;
                }
            } catch (InputMismatchException e) {
                System.out.println(e.getMessage() + ": Input must be integer");
                scanner.nextLine(); // to ignore incorrect input
            } catch (Exception e){
                System.out.println(e.getMessage());
            }
        }
    }
}
