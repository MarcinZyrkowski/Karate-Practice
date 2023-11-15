package org.example.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class JsonConverter {

  public static String serializePojo(Object pojo) {
    ObjectMapper objectMapper = new ObjectMapper();

    if (pojo == null) {
      throw new RuntimeException("Null POJO provided");
    }

    String body = null;
    try {
      body = objectMapper.writeValueAsString(pojo);
    } catch (Exception e) {
      log.error(e.getMessage());
    }

    return body;
  }

}
