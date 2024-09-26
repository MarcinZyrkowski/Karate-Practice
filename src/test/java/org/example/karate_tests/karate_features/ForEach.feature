@full
Feature: Iterating through for each

  Background:
    * def helloJavaUtil = Java.type('org.example.utils.HelloJavaUtil')
    * def userGenerator = Java.type('org.example.data_provider.UserGenerator')

  @ignore @helloKarate
  Scenario: setup hook
    When print 'helloKarate'

  Scenario: iterating through list, calling Java method, and calling karate @methods
    * def rawPeople = userGenerator.generateList()
    * def fun =
      """
      function(user) {
        karate.log(user);
        helloJavaUtil.helloJava();
        karate.call('@helloKarate')
      }
      """

    When karate.forEach(rawPeople, fun)

  Scenario: creating users in bulk request
    * def rawPeople = userGenerator.generateList()
    * def userRequest = ''
    * def fun =
      """
      function(user) {
        karate.set('userRequest', karate.toJson(user))
        karate.call('@printKarateData')
        karate.call('@createUser')
      }
      """

    When karate.forEach(rawPeople, fun)

  @ignore @printKarateData
  Scenario: print
    * print userRequest

  @ignore @createUser
  Scenario: create new user
    * url baseURL
    * path 'api/users'
    Given request userRequest
    When method POST
    Then status 201
    And print response
