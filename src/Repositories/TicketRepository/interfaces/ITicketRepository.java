package Repositories.TicketRepository.interfaces;

import Entities.Ticket;

import java.util.List;

public interface ITicketRepository {
    public boolean createTicket(Ticket ticket);
    public boolean deleteTicket(int id);
    public boolean updateTicketUser(int id, int newUserId);
    public boolean updateTicketMovie(int id, int newMovieId);
    public Ticket getTicket(int id);

    List<Ticket> getAllTickets();
}
