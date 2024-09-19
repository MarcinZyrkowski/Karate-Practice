package org.example.tm;

public class StringUtil {

  public String reverse(String string) {
    StringBuilder sb = new StringBuilder(string);
    return sb.reverse().toString();
  }

}
