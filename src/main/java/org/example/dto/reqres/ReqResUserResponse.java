package org.example.dto.reqres;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReqResUserResponse {

  private Data data;
  private Support support;

  @lombok.Data
  @NoArgsConstructor
  @AllArgsConstructor
  @Builder
  public static class Data {

    private Long id;
    private String email;
    @JsonProperty("first_name")
    private String firstName;
    @JsonProperty("last_name")
    private String lastName;
    private String avatar;
  }

  @lombok.Data
  @NoArgsConstructor
  @AllArgsConstructor
  @Builder
  public static class Support {

    private String url;
    private String text;
  }

}
