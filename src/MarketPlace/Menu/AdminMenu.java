package MarketPlace.Menu;

import Controllers.MovieController.MovieController;
import Controllers.UserController.UserController;
import Entities.Movie;
import MarketPlace.Menu.ManagementMenu.MovieMenu;
import MarketPlace.Menu.ManagementMenu.UserMenu;

import java.util.InputMismatchException;
import java.util.Scanner;

//import static Repositories.DBProporties.DBPhoneProporties.*;


public class AdminMenu {
    MovieController movieController;
    UserController userController;
    Scanner scanner;
    UserMenu userMenu;
    MovieMenu movieMenu;

    public AdminMenu(UserController userController, MovieController movieController, Scanner scanner) {
        this.movieController = movieController;
        this.userController = userController;
        this.scanner = scanner;
        userMenu = new UserMenu(userController, this.scanner);
        movieMenu = new MovieMenu(movieController, this.scanner);
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
            System.out.println("0. back");
            System.out.println();

            try {
                System.out.print("Enter option (1-5): ");
                option = scanner.nextInt();
                if (option == 1) {
                    movieMenu.start();
                } else if (option == 2) {
                    userMenu.start();
                } else {
                    break;
                }
            } catch (InputMismatchException e) {
                System.out.println(e.getMessage() + ": Input must be integer");
                scanner.nextLine(); // to ignore incorrect input
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

            System.out.println("**********************************");
        }
    }
}
