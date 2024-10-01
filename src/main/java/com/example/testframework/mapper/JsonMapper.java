package com.example.testframework.mapper;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Objects;
import lombok.SneakyThrows;

public class JsonMapper {

  private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();

  @SneakyThrows
  public static String mapToJson(Object pojo) {
    Objects.requireNonNull(pojo, "Null POJO provided");
    return OBJECT_MAPPER.writeValueAsString(pojo);
  }

}
