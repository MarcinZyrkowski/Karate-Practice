package com.example.testframework.assertion;

import com.example.testframework.mapper.JsonMapper;
import com.example.testframework.mapper.KarateMapper;
import com.example.testframework.model.dto.service.SingleUserResponse;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Map;
import org.assertj.core.api.Assertions;

public class SingleUserResponseAssertion {

  @SuppressWarnings("unused")
  public void verifySchema(Map<String, Object> karateResponse) {
    ObjectMapper mapper = new ObjectMapper()
        .configure(DeserializationFeature.FAIL_ON_MISSING_CREATOR_PROPERTIES, true);

    KarateMapper.map(mapper, karateResponse, SingleUserResponse.class);
  }

  @SuppressWarnings("unused")
  public void verifyResponseIsAsExpected(Map<String, Object> karateResponse, SingleUserResponse expectedResponse) {
    SingleUserResponse response = KarateMapper.mapToSingleUserResponse(karateResponse);

    Assertions.assertThat(response)
        .withFailMessage(
            "ACTUAL: \n" + JsonMapper.mapToJson(response) + "\nEXPECTED:\n" +
                JsonMapper.mapToJson(expectedResponse))
        .isEqualTo(expectedResponse);
  }

}
