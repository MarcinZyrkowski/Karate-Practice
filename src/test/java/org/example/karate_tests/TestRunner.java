package org.example.karate_tests;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;


public class TestRunner {

  @Karate.Test
  Karate run() {
    return Karate.run()
        .tags("@full")
        .relativeTo(getClass());
  }

  // this allows running tests in parallel mode
  @Test
  void runParallel() {
    Karate.run()
        .tags("@full")
        .relativeTo(getClass())
        .parallel(30);
  }

}
