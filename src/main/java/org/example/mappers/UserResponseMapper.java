package org.example.mappers;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Map;
import lombok.SneakyThrows;
import org.example.dto.UserResponse;

public class UserResponseMapper {

    private static final ObjectMapper objectMapper = new ObjectMapper();

    @SneakyThrows
    public static <T> T map(Map<String, Object> response, Class<T> expectedType) {
        return objectMapper
            .readValue(objectMapper.writeValueAsString(response), expectedType);
    }

    @SneakyThrows
    public static UserResponse mapToUserResponse(Map<String, Object> response) {
        return map(response, UserResponse.class);
    }

}
