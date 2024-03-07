package org.example.karate_tests;

import com.intuit.karate.junit5.Karate;


public class TestRunner {

  @Karate.Test
  Karate run() {
    return Karate.run()
        .tags("@full")
        .relativeTo(getClass());
  }

}
