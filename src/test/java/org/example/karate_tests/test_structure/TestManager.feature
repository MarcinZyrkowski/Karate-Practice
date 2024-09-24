@full
Feature: Usage of test manager

  Background:
    * def tm = Java.type('org.example.tm.TestManager').getInstance()

  Scenario: Test manager test
    Given def stringToBeReversed = "tseb eht si avaJ"
    When def reversed = tm.stringUtil.reverse(stringToBeReversed)
    Then print reversed
