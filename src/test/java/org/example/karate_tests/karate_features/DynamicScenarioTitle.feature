@full
Feature: Dynamic Scenario Title
  
  Scenario Outline: Set Title Dynamically: <title>
    * print 'something ...'
    
    Examples:
      | title        |
      | first title  |
      | second title |
