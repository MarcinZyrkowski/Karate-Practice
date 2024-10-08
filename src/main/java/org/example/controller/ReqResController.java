package org.example.controller;

import io.restassured.response.Response;
import org.apache.http.HttpStatus;
import org.assertj.core.api.Assertions;
import org.example.client.ReqResClient;
import org.example.dto.User;
import org.example.dto.UserResponse;
import org.example.dto.reqres.ReqResUserResponse;

public class ReqResController {

  private static final ReqResClient REQ_RES_CLIENT = new ReqResClient();

  @SuppressWarnings("unused")
  public static ReqResUserResponse getSingleUser(int id) {
    Response response = REQ_RES_CLIENT.getSingleUser(id);

    Assertions.assertThat(response.statusCode())
        .withFailMessage("Expected status code: 200 but was: " + response.statusCode())
        .isEqualTo(HttpStatus.SC_OK);
    return response.as(ReqResUserResponse.class);
  }

  @SuppressWarnings("unused")
  public static UserResponse createUser(User user) {
    Response response = REQ_RES_CLIENT.createUser(user);
    Assertions.assertThat(response.statusCode())
        .withFailMessage("Expected status code: 201 but was: " + response.statusCode())
        .isEqualTo(HttpStatus.SC_CREATED);
    return response.as(UserResponse.class);
  }

}
