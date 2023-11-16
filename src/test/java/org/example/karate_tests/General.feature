Feature: General Karate feature tests

  Scenario: Test Karate table
    * table myOwnTable
      | name     | sex |
      | 'Marcin' | 'M' |
      | 'Selene' | 'F' |

    Given def name = myOwnTable[1].name
    And match name == 'Selene'

  @debug
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

  @smoke
  Scenario: Usage of external scenario
    When call read('Hooks.feature@hello')