package com.example.testframework.client.service;

import com.example.testframework.client.RestClient;
import com.example.testframework.model.dto.service.User;
import io.restassured.response.Response;

public class ReqResClient extends RestClient {

  private final static String BASE_URL = "https://reqres.in/";

  private final static String GET_SINGLE_USER = "/api/users/{userId}";
  private final static String USERS = "/api/users";

  public ReqResClient() {
    super(BASE_URL);
  }

  public Response getSingleUser(int userId) {
    return basicRequestSpecification()
        .pathParam("userId", userId)
        .get(GET_SINGLE_USER);
  }

  public Response createUser(User user) {
    return basicRequestSpecification()
        .body(user)
        .post(USERS);
  }

}
