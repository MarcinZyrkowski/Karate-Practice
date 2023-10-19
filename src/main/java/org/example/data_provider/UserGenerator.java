package org.example.data_provider;

import org.example.dto.User;

public class UserGenerator {

    public static User generateUserDto() {
        return new User("Marcin", "QA");
    }

    public static User generateUserDto(String name, String job) {
        return new User(name, job);
    }

}
