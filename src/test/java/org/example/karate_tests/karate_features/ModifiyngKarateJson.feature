@full
Feature: Modifying karate JSON

  Background:
    * url baseURL
    * path 'api/users'
    * def userGenerator = Java.type('org.example.data_provider.UserGenerator')
    * def userResponseGenerator = Java.type('org.example.data_provider.UserResponseGenerator')

  Scenario: Changing value in JSON
    * def json =
      """
      {
        name: "Marcin",
        job: {
          title: "DEV"
        }
      }
      """

    When print json
    And karate.set('json', 'job.title', 'QA')
    Then print json
    When set json.job.title = 'AQA'
    And print json
  # 2 ways of modifying json


  Scenario Outline: Removing fields from json
    * def req = karate.toJson(userGenerator.generateUserDto())
    * remove req.<missingField>
    * print req

    Examples:
      | missingField |
      | name         |
      | job          |
