package org.example.utils;

import lombok.SneakyThrows;

public class Waiter {

  @SneakyThrows
  @SuppressWarnings("unused")
  public static void makeDelay() {
    Thread.sleep(3_000);
  }

}
