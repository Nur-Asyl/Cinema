package Entities;

public class Ticket {
    private int id;
    private int user_id;
    private int movie_id;

    public Ticket(int id, int user_id, int movie_id) {
        this.id = id;
        this.user_id = user_id;
        this.movie_id = movie_id;
    }
    public Ticket(int user_id, int movie_id) {
        this.user_id = user_id;
        this.movie_id = movie_id;
    }

    public static ITicketBuilder builder() {
        return new ConcreteTicketBuilder();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public String toString() {
        return "Ticket{" +
                "used_id='" + user_id + '\'' +
                ", movie_id='" + movie_id + '\'' +
                ", id=" + id +
                '}';
    }
}
