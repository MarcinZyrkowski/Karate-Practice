package org.example.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserResponse {
    private String name;
    private String job;
    @Builder.Default
    private String id = "#string";
    @Builder.Default
    private String createdAt = "#ignore";
}
