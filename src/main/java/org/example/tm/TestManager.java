package org.example.tm;

public class TestManager {
  public static TestManager getInstance() {
    return new TestManager();
  }

  // utils
  public final StringUtil stringUtil = new StringUtil();
}
