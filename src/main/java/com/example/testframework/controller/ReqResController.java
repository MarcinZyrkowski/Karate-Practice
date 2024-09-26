package com.example.testframework.controller;

import com.example.testframework.client.service.ReqResClient;
import com.example.testframework.model.dto.service.ReqResUserResponse;
import com.example.testframework.model.dto.service.User;
import io.restassured.response.Response;
import org.apache.http.HttpStatus;
import org.assertj.core.api.Assertions;


public class ReqResController {

  private final ReqResClient reqresClient = new ReqResClient();

  @SuppressWarnings("unused")
  public ReqResUserResponse getSingleUser(int id) {
    Response response = reqresClient.getSingleUser(id);

    Assertions.assertThat(response.statusCode())
        .withFailMessage("Expected status code: 200 but was: " + response.statusCode())
        .isEqualTo(HttpStatus.SC_OK);
    return response.as(ReqResUserResponse.class);
  }

  @SuppressWarnings("unused")
  public User createUser(User user) {
    Response response = reqresClient.createUser(user);
    Assertions.assertThat(response.statusCode())
        .withFailMessage("Expected status code: 201 but was: " + response.statusCode())
        .isEqualTo(HttpStatus.SC_CREATED);
    return response.as(User.class);
  }

}
