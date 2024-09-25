@full
Feature: Usage of advanced test manager

  @debug
  Scenario: Advanced Test manager test
    * def userGenerator = Java.type('org.example.data_provider.UserGenerator')
    * def rawPeople = userGenerator.generateList()

    * advancedTestManager.print(rawPeople)
    * advancedTestManager.print("ala ma kota")
    * advancedTestManager.printJson(rawPeople)
