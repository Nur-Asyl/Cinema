package Entities;

public class Order {

    private int ticketId;
    private String username;
    private String movieTitle;
    private String movieDescription;

    // Constructor
    public Order(int ticketId, String username, String movieTitle, String movieDescription) {
        this.ticketId = ticketId;
        this.username = username;
        this.movieTitle = movieTitle;
        this.movieDescription = movieDescription;
    }

    // Getters
    public int getTicketId() {
        return ticketId;
    }

    public String getUsername() {
        return username;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public String getMovieDescription() {
        return movieDescription;
    }

    // Setters
    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public void setMovieDescription(String movieDescription) {
        this.movieDescription = movieDescription;
    }

    // toString Method
    @Override
    public String toString() {
        return "Ticket ID: " + ticketId + "\nUsername: " + username +
                "\nMovie Title: " + movieTitle + "\nMovie Description: " + movieDescription;
    }

}
