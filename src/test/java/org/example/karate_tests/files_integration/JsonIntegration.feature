@full
Feature: files integration test

  Background:
    * url baseURL
    * path 'api/users'

  Scenario: integration with JSON
    * def expectedResponse = read('file:src/test/resources/files_integration/postResponse.json')
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