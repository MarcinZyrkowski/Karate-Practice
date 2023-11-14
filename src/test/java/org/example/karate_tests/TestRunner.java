package org.example.karate_tests;

import com.intuit.karate.junit5.Karate;


public class TestRunner {

  @Karate.Test
  Karate run() {
    return Karate.run(
            "GetListOfUsers.feature",
            "PostNewUser.feature",
            "General.feature",
            "GetListOfResource.feature")
        .relativeTo(getClass());
  }

}
