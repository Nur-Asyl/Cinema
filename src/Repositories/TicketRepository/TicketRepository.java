package Repositories.TicketRepository;

import Data.interfaces.IDB;
import Entities.Ticket;
import Repositories.TicketRepository.interfaces.ITicketRepository;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

import static Repositories.DBProporties.DBTicketProporties.*;

public class TicketRepository implements ITicketRepository {
    private final IDB db;

    public TicketRepository(IDB db) {
        this.db = db;
    }

    @Override
    public boolean createTicket(Ticket ticket) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "INSERT INTO " + DB_TICKET_TABLE + "(" +
                    DB_TICKET_USER_ID + "," +
                    DB_TICKET_MOVIE_ID + ") VALUES (?,?)";
            PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, ticket.getUser_id());
            st.setInt(2, ticket.getMovie_id());

            st.execute();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return false;
    }

    @Override
    public boolean deleteTicket(int id) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "DELETE FROM " + DB_TICKET_TABLE + " WHERE id=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, id);

            st.executeUpdate();
            return true;
        } catch(SQLException throwables){
            throwables.printStackTrace();
        } catch(ClassNotFoundException e){
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch(SQLException throwables){
                throwables.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean updateTicketMovie(int id, int newMovieId) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "UPDATE " + DB_TICKET_TABLE + " SET " + DB_TICKET_MOVIE_ID + " = ? WHERE id=?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, newMovieId);
            st.setInt(2, id);

            st.executeUpdate();
            return true;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException throwables){
                throwables.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean updateTicketUser(int id, int newUserId) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "UPDATE " + DB_TICKET_TABLE + " SET " + DB_TICKET_USER_ID + " = ? WHERE id=?";

            PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, newUserId);
            st.setInt(2, id);


            st.executeUpdate();
            return true;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException throwables){
                throwables.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public List<Ticket> getTicketByUserId(int id) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "SELECT " +
                    DB_TICKET_ID + "," +
                    DB_TICKET_USER_ID + "," +
                    DB_TICKET_MOVIE_ID + " FROM " + DB_TICKET_TABLE + " WHERE userid=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, id);

            ResultSet rs = st.executeQuery();

            List<Ticket> tickets = new LinkedList<>();
            while(rs.next()) {
                Ticket ticket = new Ticket(rs.getInt(DB_TICKET_ID),
                        rs.getInt(DB_TICKET_USER_ID),
                        rs.getInt(DB_TICKET_MOVIE_ID));

                tickets.add(ticket);
            }

            return tickets;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public Ticket getTicket(int id) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "SELECT " +
                    DB_TICKET_ID + "," +
                    DB_TICKET_USER_ID + "," +
                    DB_TICKET_MOVIE_ID + " FROM " + DB_TICKET_TABLE + " WHERE id=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, id);

            ResultSet rs = st.executeQuery();

            if(rs.next()) {
                Ticket ticket = new Ticket(rs.getInt(DB_TICKET_ID),
                        rs.getInt(DB_TICKET_USER_ID),
                        rs.getInt(DB_TICKET_MOVIE_ID));
                return ticket;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public List<Ticket> getAllTickets() {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "SELECT " +
                    DB_TICKET_ID + "," +
                    DB_TICKET_USER_ID + "," +
                    DB_TICKET_MOVIE_ID + " FROM " + DB_TICKET_TABLE;
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(sql);
            List<Ticket> tickets = new LinkedList<>();
            while(rs.next()) {
                Ticket ticket = new Ticket(rs.getInt(DB_TICKET_ID),
                        rs.getInt(DB_TICKET_USER_ID),
                        rs.getInt(DB_TICKET_MOVIE_ID));

                tickets.add(ticket);
            }

            return tickets;
        } catch (SQLException throwables){
            throwables.printStackTrace();
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException throwables){
                throwables.printStackTrace();
            }
        }
        return null;
    }
}
