package Controllers.UserController;

import Entities.Users.User;
import Repositories.UserRepository.interfaces.IUserRepository;
import MarketPlace.Application;

import java.util.List;

public class UserController {
    private final IUserRepository userRepo;

    public UserController(IUserRepository userRepo) {
        this.userRepo = userRepo;
    }


    public String createUser(String user_name, String password) {
        User user = new User(user_name, password);
        boolean created = userRepo.createUser(user);
        return (created) ? "|------| User created |------|" : "|------| User not created |------|";
    }

    public String deleteUser(int id) {
        boolean deleted = userRepo.deleteUser(id);
        return (deleted) ? "|------| User deleted |------|" : "|------| User not deleted |------|";
    }

    public String updateUserName(int id, String newValue) {
        boolean updated = userRepo.updateUserName(id, newValue);
        return (updated) ? "|------| User updated |------|" : "|------| User not updated |------|";
    }

    public String updateUserPassword(int id, String newValue) {
        boolean updated = userRepo.updateUserPassword(id, newValue);
        return (updated) ? "|------| User updated |------|" : "|------| User not updated |------|";
    }

    public String getUser(int id){
        User u = userRepo.getUser(id);
        return (u != null) ? u.toString() : "|------| User not found |------|";
    }

    public String getUserPassword(int id){
        User u = userRepo.getUser(id);
        return (u != null) ? u.getPassword() : null;
    }

    public String getAllUsers() {
        String displayAllUsers = "";
        List<User> users = userRepo.getAllUsers();
        for(User u : users){
            displayAllUsers += u.toString() + "\n";
        }
        return displayAllUsers;
    }
}
