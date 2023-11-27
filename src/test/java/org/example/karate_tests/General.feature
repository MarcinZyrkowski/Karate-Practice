Feature: General Karate feature tests

  Background:
    * def userGenerator = Java.type('org.example.data_provider.UserGenerator')

  Scenario: Test Karate table
    * table myOwnTable
      | name     | sex |
      | 'Marcin' | 'M' |
      | 'Selene' | 'F' |

    Given def name = myOwnTable[1].name
    And match name == 'Selene'

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

  @ignore @print
  Scenario: table hook
    Given print name

  Scenario: Test with table
    * table data
      | name   | job        |
      | 'Tom'  | 'Java Dev' |
      | 'Mark' | 'PM'       |
    * call read('@print') data
    # prints row by row


  Scenario: iterating through list, calling Java method, and calling karate @methods
    * def rawPeople = userGenerator.generateList()
    * def people = karate.toJson(rawPeople)
    * print people
    * def fun =
    """
    function(user) {
          karate.log(user);
          userGenerator.hello();
          karate.call('@hello')
    }
    """

    * karate.forEach(rawPeople, fun)

  @ignore @hello
  Scenario: setup hook
    When print 'helloKarate'

  @debug
  Scenario: creating users in bulk request
    * def rawPeople = userGenerator.generateList()
    * def userRequest = 'kot'
    * def data = ''
    * def fun =
    """
    function(user) {
          karate.set('userRequest', karate.toJson(user))
          karate.set('data', userRequest)
          karate.call('@printKarateData')
          karate.call('Hooks.feature@createUser')
    }
    """


    * karate.forEach(rawPeople, fun)


  @ignore @printKarateData
  Scenario: print
    * print data
