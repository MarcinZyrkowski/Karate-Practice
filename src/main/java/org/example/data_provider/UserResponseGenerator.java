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

    public static UserResponse generateUserResponse(String name, String job) {
        return UserResponse.builder()
                .name(name)
                .job(job)
                .build();
    }

}
