package Controllers.TicketController;

import Entities.Ticket;
import Repositories.TicketRepository.interfaces.ITicketRepository;

import java.util.List;

public class TicketController {
    private final ITicketRepository ticketRepo;

    public TicketController(ITicketRepository ticketRepo) {
        this.ticketRepo = ticketRepo;
    }

    public String createTicket(int userId, int movieId, int seatNumber) {
        Ticket ticket = new Ticket(userId, movieId, seatNumber);
        boolean created = ticketRepo.createTicket(ticket);
        return (created) ? "|------| Ticket created |------|" : "|------| Ticket not created |------|";
    }

    public String deleteTicket(int id) {
        boolean closed = ticketRepo.deleteTicket(id);
        return (closed) ? "|------| Ticket closed |------|" : "|------| Ticket not closed |------|";
    }

    public String updateTicketUser(int id, int newUserId) {
        boolean updated = ticketRepo.updateTicketUser(id, newUserId);
        return (updated) ? "|------| Ticket user updated |------|" : "|------| Ticket user not updated |------|";
    }

    public String updateTicketMovie(int id, int newMovieId) {
        boolean updated = ticketRepo.updateTicketMovie(id, newMovieId);
        return (updated) ? "|------| Ticket movie updated |------|" : "|------| Ticket movie not updated |------|";
    }

    public String getTicket(int id) {
        Ticket ticket = ticketRepo.getTicket(id);
        return (ticket != null) ? ticket.toString() : "|------| Ticket not found |------|";
    }

    public List<Ticket> getAllTickets() {
        return ticketRepo.getAllTickets();
    }
}
