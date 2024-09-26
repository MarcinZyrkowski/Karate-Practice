package com.example.testframework.generator;


import com.example.testframework.model.dto.service.User;

public class UserGenerator {

  public User generateSpecificUser() {
    return User.builder()
        .name("Marcin")
        .job("QA")
        .build();
  }

}
