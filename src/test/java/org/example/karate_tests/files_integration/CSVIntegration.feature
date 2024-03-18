Feature: CSV Integration
  
  Scenario: reading fromcsv file
    * def csvFile = read('file:src/test/resources/files_integration/people.csv')
    * print csvFile[0]
    * print csvFile[1]