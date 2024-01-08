package org.example.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;

public class JsonConverter {

  @SneakyThrows
  public static String serializePojo(Object pojo) {
    ObjectMapper objectMapper = new ObjectMapper();

    if (pojo == null) {
      throw new RuntimeException("Null POJO provided");
    }

    return objectMapper.writeValueAsString(pojo);
  }

}
