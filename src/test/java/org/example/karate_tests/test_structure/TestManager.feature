Feature: Usage of test manager

  Scenario: Test manager test
    # Prerequisites
    * def TestManager = Java.type('org.example.tm.TestManager')
    * def tm = TestManager.getInstance()

    # Usage
    * def stringToBeReversed = "tseb eht si avaJ"
    * def reversed = tm.stringUtil.reverse(stringToBeReversed)
    * print reversed
