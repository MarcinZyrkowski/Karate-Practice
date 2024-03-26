@full
Feature: Parsing string to Json
  
  Background:
    * url baseURL
    * path 'api/users'
    * def userGenerator = Java.type('org.example.data_provider.UserGenerator')
    * def jsonConverter = Java.type('org.example.utils.JsonConverter')
  
  Scenario: Parse string to karate JSON using JSON.parse()
    * def userRequest = userGenerator.generateUserDto()
    * def requestBody = jsonConverter.serializePojo(userRequest)
    
    Given request JSON.parse(requestBody)
    When method post
    Then status 201
    And print response
    And match response == {"name": "Marcin", "job": "QA", "id":  "#string", "createdAt":  "#ignore"}
