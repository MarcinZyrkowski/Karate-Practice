@full
Feature: Working with table
  
  Scenario: Test Karate table
    * table myOwnTable
      | name     | sex |
      | 'Marcin' | 'M' |
      | 'Selene' | 'F' |
    
    Given def name = myOwnTable[1].name
    And match name == 'Selene'
  
  
  @ignore @print
  Scenario: table hook
    Given print name
  
  Scenario: Test with table
    * table data
      | name   | job        |
      | 'Tom'  | 'Java Dev' |
      | 'Mark' | 'PM'       |
    * call read('@print') data
  # prints row by row