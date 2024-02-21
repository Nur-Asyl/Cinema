package Entities.Users;

import Entities.Users.interfaces.IUser;

public class User implements IUser {
    private String userName;
    private String password;
    private int id;

    public User(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public User(String user_name, String password, int id) {
        this.userName = user_name;
        this.password = password;
        this.id = id;
    }
    @Override
    public String getUserName() {
        return userName;
    }
    @Override
    public void setUserName(String userName) {
        this.userName = userName;
    }
    @Override
    public String getPassword() {
        return password;
    }
    @Override
    public void setPassword(String password) {
        this.password = password;
    }
    @Override
    public int getId() {
        return id;
    }
    @Override
    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_name='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", id=" + id +
                '}';
    }
}
