package org.example.client;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.specification.RequestSpecification;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class RestClient {

  protected final String baseURL;

  public RequestSpecification basicRequestSpecification() {
    return RestAssured.given()
        .relaxedHTTPSValidation()
        .contentType(ContentType.JSON)
        .baseUri(baseURL);
  }

}
