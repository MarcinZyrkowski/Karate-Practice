package org.example.data_provider;

import org.example.dto.User;

public class UserGenerator {

    public static User generateUserDto() {
        return new User("Marcin", "QA");
    }

}
