package Cinema.Menu.ManagementMenu;

import Controllers.UserController.UserController;

import java.util.InputMismatchException;
import java.util.Scanner;

import static Repositories.DBProporties.DBUserProporties.*;

public class UserMenu {

    Scanner scanner;
    UserController userController;


    public UserMenu(UserController userController, Scanner scanner) {
        this.userController = userController;
        this.scanner = scanner;
    }
    public void start() {
        while (true) {
            System.out.println();
            System.out.println("**********************************");
            System.out.println("------MANAGE_USERS------");
            System.out.println("Select option:");
            System.out.println("1. Get all users");
            System.out.println("2. Get user by id");
            System.out.println("3. Create user");
            System.out.println("4. Update user");
            System.out.println("5. Delete user");

            System.out.println("0. Exit");
            System.out.println();

            try {
                System.out.print("Enter option (1-5): ");
                int option = scanner.nextInt();
                if (option == 1) {
                    getAllUsersMenu();
                } else if (option == 2) {
                    getUserByIdMenu();
                } else if (option == 3) {
                    createUserMenu();
                } else if (option == 4) {
                    updateUserMenu();
                } else if (option == 5) {
                    deleteUserMenu();
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


    public void getAllUsersMenu() {
        String response = userController.getAllUsers();
        System.out.println(response);
    }

    public void getUserByIdMenu() {
        System.out.print("Please enter id: ");

        int id = scanner.nextInt();
        String response = userController.getUser(id);
        System.out.println(response);
    }

    public void createUserMenu() {
        System.out.println("Please enter " + DB_USER_NAME);
        String name = scanner.next();

        System.out.println("Please enter " + DB_USER_PASSWORD);
        String password = scanner.next();

        String response = userController.createUser(name, password);
        System.out.println(response);
    }

    public void updateUserMenu(){
        System.out.print("Enter id: ");
        int id = scanner.nextInt();
        while(true) {
            userController.getUser(id).toString();
            System.out.print("Edit:" +
                    "\n1. " + DB_USER_NAME +
                    "\n2. " + DB_USER_PASSWORD +
                    "\n9. back" +
                    "\nEnter option(1-5): ");
            try {
                int option = scanner.nextInt();
                if (option == 1) {
                    System.out.print("Edit" + DB_USER_NAME + " : ");
                    System.out.println("\t" + userController.updateUserName(id, scanner.next()));
                } else if (option == 2) {
                    System.out.print("Edit" + DB_USER_PASSWORD + " : ");
                    System.out.println("\t" + userController.updateUserPassword(id, scanner.next()));
                } else {
                    break;
                }
            } catch (InputMismatchException e) {
                System.out.println(e.getMessage() + ": Input must be integer");
                scanner.nextLine(); // to ignore incorrect input
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }

    public void deleteUserMenu(){
        System.out.print("Please enter id: ");

        int id = scanner.nextInt();
        String response = userController.deleteUser(id);
        System.out.println(response);
    }

}
