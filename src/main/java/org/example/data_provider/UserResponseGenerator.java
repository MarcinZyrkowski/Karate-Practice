package org.example.data_provider;

import org.example.dto.UserResponse;

public class UserResponseGenerator {

    public static UserResponse generateUserResponse() {
        return UserResponse.builder()
                .name("Marcin")
                .job("QA")
                .id("#string")
                .createdAt("#ignore")
                .build();
    }

}
