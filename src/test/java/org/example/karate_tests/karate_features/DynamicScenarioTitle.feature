@full
Feature: Dynamic Scenario Title
  
  @debug
  Scenario Outline: Set Title Dynamically: <title>
    * print 'something ...'
    
    Examples:
      | title        |
      | firtst title |
      | second title |
