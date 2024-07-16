package org.example.client;

import io.restassured.response.Response;

public class ReqResClient extends RestClient {

    private final static String BASE_URL = "https://reqres.in/";

    private final static String GET_SINGLE_USER = "/api/users/{userId}";

    public ReqResClient() {
        super(BASE_URL);
    }

    public Response getSingleUser(int userId) {
        return basicRequestSpecification()
            .pathParam("userId", userId)
            .get(GET_SINGLE_USER);
    }

}
