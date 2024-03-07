package org.example.data_provider;

import org.example.dto.User;
import org.example.utils.JsonConverter;

import java.util.List;

public class UserGenerator {

    public static User generateUserDto() {
        return new User("Marcin", "QA");
    }

    public static User generateUserDto(String name, String job) {
        return new User(name, job);
    }

    public static String generateUserDtoAsJson() {
        return JsonConverter.serializePojo(new User("Marcin", "QA"));
    }

    public static List<User> generateList() {
        return List.of(new User("Marcin", "QA"), new User("Tomek", "PM"));
    }

}
