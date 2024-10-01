package com.example.testframework.factory;

import com.example.testframework.model.dto.service.SingleUserResponse;
import com.example.testframework.model.dto.service.SingleUserResponse.Data;
import com.example.testframework.model.dto.service.SingleUserResponse.Support;

public class SingleUserResponseFactory {

  public SingleUserResponse userWithId2() {
    return SingleUserResponse.builder()
        .data(Data.builder()
            .id(2L)
            .email("janet.weaver@reqres.in")
            .firstName("Janet")
            .lastName("Weaver")
            .avatar("https://reqres.in/img/faces/2-image.jpg")
            .build())
        .support(Support.builder()
            .url("https://reqres.in/#support-heading")
            .text("To keep ReqRes free, contributions towards server costs are appreciated!")
            .build())
        .build();
  }

}
