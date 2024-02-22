package Entities;

public interface ITicketBuilder {
    ITicketBuilder setUserId(int userId);
    ITicketBuilder setMovieId(int movieId);
    Ticket build();
}
