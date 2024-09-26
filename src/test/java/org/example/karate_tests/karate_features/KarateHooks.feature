@full
Feature: Karate hooks

  Background:
    * print 'background works as before each'
    * print 'before: ' + karate.scenario.name
    * configure afterScenario =
      """
      function(){
        karate.log('after scenario:', 'after: ' + karate.scenario.name);
      }
      """

  Scenario: test 1
    * print 'dummy test 1'

  Scenario: test 2
    * print 'dummy test 2'
