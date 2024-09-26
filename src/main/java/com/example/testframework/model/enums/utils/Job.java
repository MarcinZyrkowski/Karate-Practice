package com.example.testframework.model.enums.utils;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Job {
  QA("QA"),
  DEV("DEV"),
  PM("PM");

  private final String job;
}
