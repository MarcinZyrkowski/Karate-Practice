@full
Feature: Usage of advanced test manager

  Scenario: Advanced Test manager test
    * advancedTestManager.print("temp string")
    * def userGenerator = Java.type('org.example.data_provider.UserGenerator')
    * def rawPeople = userGenerator.generateList()
    * advancedTestManager.print(rawPeople)

