package Entities.Users.Staff;

import Entities.Users.User;
import Entities.Users.interfaces.IAdmin;

public class Admin extends User implements IAdmin {

    public Admin(String user_name, String password, int id) {
        super(user_name, password, id);
    }

}
