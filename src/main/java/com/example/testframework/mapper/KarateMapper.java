package com.example.testframework.mapper;

import com.example.testframework.model.dto.service.SingleUserResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Map;
import lombok.SneakyThrows;

public class KarateMapper {

  private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();

  @SneakyThrows
  public static <T> T map(ObjectMapper mapper, Map<String, Object> response, Class<T> expectedType) {
    return mapper
        .readValue(mapper.writeValueAsString(response), expectedType);
  }

  public static <T> T map(Map<String, Object> response, Class<T> expectedType) {
    return map(OBJECT_MAPPER, response, expectedType);
  }

  public static SingleUserResponse mapToSingleUserResponse(Map<String, Object> response) {
    return map(response, SingleUserResponse.class);
  }

}
