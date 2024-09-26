package com.example.testframework.factory;

import com.example.testframework.generator.UserGenerator;
import com.example.testframework.model.dto.service.User;

public class UserFactory {

  private final UserGenerator userGenerator = new UserGenerator();

  public User specificUser() {
    return userGenerator.generateSpecificUser();
  }

  public User randomUser() {
    return userGenerator.generateRandomUser();
  }

}
