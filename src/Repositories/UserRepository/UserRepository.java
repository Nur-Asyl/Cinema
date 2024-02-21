package Repositories.UserRepository;

import Data.interfaces.IDB;
import Entities.Users.User;
import Repositories.UserRepository.interfaces.IUserRepository;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

import static Repositories.DBProporties.DBUserProporties.*;

public class UserRepository implements IUserRepository {
    private final IDB db;

    public UserRepository(IDB db) {
        this.db = db;
    }

    @Override
    public boolean createUser(User user) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "INSERT INTO " + DB_USER_TABLE + "(" +
                    DB_USER_NAME + "," +
                    DB_USER_PASSWORD + ") VALUES (?,?)";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, user.getUserName());
            st.setString(2, user.getPassword());

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
    public boolean deleteUser(int id) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "DELETE FROM " + DB_USER_TABLE + " WHERE id=?";
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
    public boolean updateUserName(int id, String newValue) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "UPDATE " + DB_USER_TABLE + " SET " + DB_USER_NAME + " = ? WHERE id=?";

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
    public boolean updateUserPassword(int id, String newValue) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "UPDATE " + DB_USER_TABLE + " SET " + DB_USER_PASSWORD + " = ? WHERE id=?";

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
    public User getUser(int id) {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "SELECT " +
                    DB_USER_ID + "," +
                    DB_USER_NAME + "," +
                    DB_USER_PASSWORD + " FROM " + DB_USER_TABLE + " WHERE id=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, id);

            ResultSet rs = st.executeQuery();

            if(rs.next()) {
                User user = new User(rs.getString(DB_USER_NAME),
                        rs.getString(DB_USER_PASSWORD),
                        rs.getInt(DB_USER_ID));
                return user;
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
    public List<User> getAllUsers() {
        Connection con = null;
        try {
            con = db.getConnection();
            String sql = "SELECT " +
                    DB_USER_ID + "," +
                    DB_USER_NAME + "," +
                    DB_USER_PASSWORD + " FROM " + DB_USER_TABLE;
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(sql);
            List<User> users = new LinkedList<>();
            while(rs.next()) {
                User user = new User(rs.getString(DB_USER_NAME),
                        rs.getString(DB_USER_PASSWORD),
                        rs.getInt(DB_USER_ID));

                users.add(user);
            }

            return users;
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
