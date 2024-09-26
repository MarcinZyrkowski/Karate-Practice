package com.example.testframework.utils;

import java.util.Random;

public class EnumUtils {

  private static final Random RANDOM = new Random();

  public static <T extends Enum<T>> T getRandomValue(Class<T> enumClass) {
    T[] enumValues = enumClass.getEnumConstants();
    return enumValues[RANDOM.nextInt(enumValues.length)];
  }

}
