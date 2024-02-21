package MarketPlace.Menu;

import Controllers.TicketController.TicketController;
import Controllers.UserController.UserController;

import java.util.InputMismatchException;
import java.util.Scanner;

public class StoreMenu {
    Scanner scanner;
    UserController userController;
    TicketController ticketController;

    public StoreMenu(UserController userController, TicketController ticketController, Scanner scanner) {
        this.scanner = scanner;
        this.userController = userController;
        this.ticketController = ticketController;
    }

    public void start(int userId){
        System.out.println("-------------------------------------------");
        System.out.println(ticketController.getAllTickets());
        System.out.println("-------------------------------------------");
        System.out.println("\nSelect option:");
        System.out.println("1. Get Ticket");
        System.out.println("0. back");
        System.out.print("Option:");
        try {
            int option = scanner.nextInt();
            switch(option) {
                case 1:
                    getTicketMenu(userId);
                    break;
                default:
                    break;
            }
        } catch (InputMismatchException e){
            System.out.println(e.getMessage() + ": Input must be integer");
            scanner.nextLine();
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    public void getTicketMenu(int id){
        System.out.print("Choose ticket by id:");
        int ticketId = scanner.nextInt();
        String response = ticketController.getTicket(ticketId);
        System.out.println(response);
    }
}
