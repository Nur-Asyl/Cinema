package Entities;

public class ConcreteTicketBuilder implements ITicketBuilder {
    private int userId;
    private int movieId;

    @Override
    public ITicketBuilder setUserId(int userId) {
        this.userId = userId;
        return this;
    }

    @Override
    public ITicketBuilder setMovieId(int movieId) {
        this.movieId = movieId;
        return this;
    }

    @Override
    public Ticket build() {
        return new Ticket(userId, movieId);
    }
}