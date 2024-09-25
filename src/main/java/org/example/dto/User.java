package org.example.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class User {

    private String name;
    private String job;
    private String id;
    private String createdAt;

    public User(String name, String job) {
        this.name = name;
        this.job = job;
    }
}
