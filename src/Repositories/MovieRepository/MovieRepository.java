package Repositories.MovieRepository;

import Data.interfaces.IDB;
import Entities.Movie;
import Repositories.MovieRepository.interfaces.IMovieRepository;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

import static Repositories.DBProporties.DBMovieProporties.*;

public class MovieRepository implements IMovieRepository {
    private final IDB db;

    public MovieRepository(IDB db) {
        this.db = db;
    }

    @Override
    public boolean createMovie(Movie movie) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "INSERT INTO " + DB_MOVIE_TABLE + "(" +
                    DB_MOVIE_TITLE + "," +
                    DB_MOVIE_DESCRIPTION + ") VALUES (?,?)";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, movie.getTitle());
            st.setString(2, movie.getDescription());

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
    public boolean deleteMovie(int id) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "DELETE FROM " + DB_MOVIE_TABLE + " WHERE id=?";
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
    public boolean updateMovieTitle(int id, String newValue) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "UPDATE " + DB_MOVIE_TABLE + " SET " + DB_MOVIE_TITLE + " = ? WHERE id=?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, newValue);
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
    public boolean updateMovieDescription(int id, String newValue) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "UPDATE " + DB_MOVIE_TABLE + " SET " + DB_MOVIE_DESCRIPTION + " = ? WHERE id=?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, newValue);
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
    public Movie getMovie(int id) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "SELECT " +
                    DB_MOVIE_ID + "," +
                    DB_MOVIE_TITLE + "," +
                    DB_MOVIE_DESCRIPTION + " FROM " + DB_MOVIE_TABLE + " WHERE id=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, id);

            ResultSet rs = st.executeQuery();

            if(rs.next()) {
                Movie movie = new Movie(rs.getInt(DB_MOVIE_ID),
                        rs.getString(DB_MOVIE_TITLE),
                        rs.getString(DB_MOVIE_DESCRIPTION));
                return movie;
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
    public List<Movie> getAllMovies() {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "SELECT " +
                    DB_MOVIE_ID + "," +
                    DB_MOVIE_TITLE + "," +
                    DB_MOVIE_DESCRIPTION + " FROM " + DB_MOVIE_TABLE;
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(sql);
            List<Movie> movies = new LinkedList<>();
            while(rs.next()) {
                Movie movie = new Movie(rs.getInt(DB_MOVIE_ID),
                        rs.getString(DB_MOVIE_TITLE),
                        rs.getString(DB_MOVIE_DESCRIPTION));

                movies.add(movie);
            }

            return movies;
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
