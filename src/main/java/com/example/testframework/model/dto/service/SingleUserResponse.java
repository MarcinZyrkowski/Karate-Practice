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
      @JsonProperty("id") Long id,
      @JsonProperty("email") String email,
      @JsonProperty("first_name") String firstName,
      @JsonProperty("last_name") String lastName,
      @JsonProperty("avatar") String avatar) {

  }

  @Builder
  public record Support(
      @JsonProperty("url") String url,
      @JsonProperty("text") String text
  ) {

  }

}
