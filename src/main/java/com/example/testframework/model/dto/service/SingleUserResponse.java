package com.example.testframework.model.dto.service;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;

@Builder
public record SingleUserResponse(
    Data data,
    Support support
) {

  @Builder
  public record Data(
      Long id,
      String email,
      @JsonProperty("first_name") String firstName,
      @JsonProperty("last_name") String lastName,
      String avatar) {

  }

  @Builder
  public record Support(
      String url,
      String text
  ) {

  }

}
