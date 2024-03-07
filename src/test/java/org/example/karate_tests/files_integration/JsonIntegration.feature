@full
Feature: files integration test

  Background:
    * url baseURL
    * path 'api/users'
    * def expectedResponse = read('file:src/test/resources/files_integration/postResponse.json')

  Scenario: compare response with prepared expected response as JSON
    * def requestBody =
    """
    {
      "name": "Marcin",
      "job": "QA"
    }
    """

    Given request requestBody
    When method post
    Then status 201
    And print response
    And match response == expectedResponse

  Scenario: prepare user data using JSON and dynamic evaluation of embedded expression in karate
    * def name = 'Marcin'
    * def job = 'QA'
    * def requestBody = read('file:src/test/resources/files_integration/requestBody.json')

    Given request requestBody
    When method post
    Then status 201
    And print response
    And match response == expectedResponse
