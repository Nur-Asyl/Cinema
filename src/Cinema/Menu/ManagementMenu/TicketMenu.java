package Cinema.Menu.ManagementMenu;

import Controllers.OrderController.OrderController;
import Controllers.TicketController.TicketController;
import Entities.Order;
import Entities.Ticket;

import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class TicketMenu {
    private final TicketController ticketController;
    private final OrderController orderController;
    private final Scanner scanner;

    public TicketMenu(TicketController ticketController, OrderController orderController, Scanner scanner) {
        this.ticketController = ticketController;
        this.orderController = orderController;
        this.scanner = scanner;
    }

    public void start() {
        while (true) {
            System.out.println();
            System.out.println("**********************************");
            System.out.println("------MANAGE_TICKETS------");
            System.out.println("Select option:");
            System.out.println("1. Get all tickets");
            System.out.println("2. Get ticket by ID");
            System.out.println("3. Create ticket");
            System.out.println("4. Update ticket user");
            System.out.println("5. Update ticket movie");
            System.out.println("6. Delete ticket");
            System.out.println("0. Exit");
            System.out.println();

            try {
                System.out.print("Enter option (0-6): ");
                int option = scanner.nextInt();
                switch (option) {
                    case 1:
                        System.out.println(ticketController.getAllTickets());
                        break;
                    case 2:
                        getTicketByIdMenu();
                        break;
                    case 3:
                        createTicketMenu();
                        break;
                    case 4:
                        updateTicketUserMenu();
                        break;
                    case 5:
                        updateTicketMovieMenu();
                        break;
                    case 6:
                        deleteTicketMenu();
                        break;
                    default:
                        return;
                }
            } catch (InputMismatchException e) {
                System.out.println(e.getMessage() + ": Input must be an integer");
                scanner.nextLine();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }

    public void getTicketByIdMenu() {
        System.out.print("Enter ticket ID: ");
        int id = scanner.nextInt();
        String response = ticketController.getTicket(id);
        System.out.println(response);
    }

    public void createTicketMenu() {
        System.out.print("Enter user ID: ");
        int userId = scanner.nextInt();
        System.out.print("Enter movie ID: ");
        int movieId = scanner.nextInt();
        System.out.println(ticketController.createTicket(userId, movieId));
    }

    public void updateTicketUserMenu() {
        System.out.print("Enter ticket ID: ");
        int id = scanner.nextInt();
        System.out.print("Enter new user ID: ");
        int newUserId = scanner.nextInt();
        String response = ticketController.updateTicketUser(id, newUserId);
        System.out.println(response);
    }

    public void updateTicketMovieMenu() {
        System.out.print("Enter ticket ID: ");
        int id = scanner.nextInt();
        System.out.print("Enter new movie ID: ");
        int newMovieId = scanner.nextInt();
        String response = ticketController.updateTicketMovie(id, newMovieId);
        System.out.println(response);
    }

    public void deleteTicketMenu() {
        System.out.print("Enter ticket ID: ");
        int id = scanner.nextInt();
        String response = ticketController.deleteTicket(id);
        System.out.println(response);
    }
}
