package Cinema.Menu.ManagementMenu;

import Controllers.MovieController.MovieController;

import java.util.InputMismatchException;
import java.util.Scanner;

public class MovieMenu {
    private final MovieController movieController;
    private final Scanner scanner;

    public MovieMenu(MovieController movieController, Scanner scanner) {
        this.movieController = movieController;
        this.scanner = scanner;
    }

    public void start() {
        while (true) {
            System.out.println();
            System.out.println("**********************************");
            System.out.println("------MANAGE_MOVIES------");
            System.out.println("Select option:");
            System.out.println("1. Get all movies");
            System.out.println("2. Get movie by id");
            System.out.println("3. Create movie");
            System.out.println("4. Update movie title");
            System.out.println("5. Update movie description");
            System.out.println("6. Delete movie");
            System.out.println("0. Exit");
            System.out.println();

            try {
                System.out.print("Enter option (1-6): ");
                int option = scanner.nextInt();
                if (option == 1) {
                    getAllMoviesMenu();
                } else if (option == 2) {
                    getMovieByIdMenu();
                } else if (option == 3) {
                    createMovieMenu();
                } else if (option == 4) {
                    updateMovieTitleMenu();
                } else if (option == 5) {
                    updateMovieDescriptionMenu();
                } else if (option == 6) {
                    deleteMovieMenu();
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

    public void getAllMoviesMenu() {
        String response = movieController.getAllMovies();
        System.out.println(response);
    }

    public void getMovieByIdMenu() {
        System.out.print("Please enter movie id: ");
        int id = scanner.nextInt();
        String response = movieController.getMovie(id);
        System.out.println(response);
    }

    public void createMovieMenu() {
        scanner.nextLine(); // consume newline
        System.out.print("Enter title: ");
        String title = scanner.nextLine();
        System.out.print("Enter description: ");
        String description = scanner.nextLine();
        String response = movieController.createMovie(title, description);
        System.out.println(response);
    }

    public void updateMovieTitleMenu() {
        System.out.print("Enter movie id: ");
        int id = scanner.nextInt();
        scanner.nextLine(); // consume newline
        System.out.print("Enter new title: ");
        String newTitle = scanner.nextLine();
        String response = movieController.updateMovieTitle(id, newTitle);
        System.out.println(response);
    }

    public void updateMovieDescriptionMenu() {
        System.out.print("Enter movie id: ");
        int id = scanner.nextInt();
        scanner.nextLine(); // consume newline
        System.out.print("Enter new description: ");
        String newDescription = scanner.nextLine();
        String response = movieController.updateMovieDescription(id, newDescription);
        System.out.println(response);
    }

    public void deleteMovieMenu() {
        System.out.print("Please enter movie id: ");
        int id = scanner.nextInt();
        String response = movieController.deleteMovie(id);
        System.out.println(response);
    }
}
