package org.example.karate_tests.javaAPI;

import com.intuit.karate.Http;
import com.intuit.karate.Json;
import com.intuit.karate.Match;
import java.util.List;
import org.junit.jupiter.api.Test;

public class JavaApiTest {

    private static final String url = "https://jsonplaceholder.typicode.com/users";

    @Test
    public void javaApiIntegration() {

        List users = Http.to(url)
            .get()
            .json()
            .asList();

        Match.that(users.get(0)).contains("{ name: 'Leanne Graham' }");

        String city = Json.of(users).get("$[0].address.city");

        Match.that("Gwenborough").isEqualTo(city);
    }

}
