Feature: General Karate feature tests

  Scenario: Test Karate table
    * table myOwnTable
    | name      | sex   |
    | 'Marcin'  | 'M'   |
    | 'Selene'  | 'F'   |

    Given def name = myOwnTable[1].name
    And match name == 'Selene'