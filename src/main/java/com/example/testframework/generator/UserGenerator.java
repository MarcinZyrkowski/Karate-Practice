package com.example.testframework.generator;

import com.example.testframework.model.dto.service.User;
import com.example.testframework.model.enums.utils.Job;
import com.example.testframework.utils.EnumUtils;

public class UserGenerator {

  public User generateSpecificUser() {
    return User.builder()
        .name("Marcin")
        .job("QA")
        .build();
  }

  public User generateRandomUser() {
    return User.builder()
        .name("Marcin")
        .job(EnumUtils.getRandomValue(Job.class).getJob())
        .build();
  }

}
