@regression
Feature: Create User

  Background:
    * def tm = Java.type('com.example.testframework.manager.TestManager').getInstance()

  Scenario: Create User with valid data
    * print user = tm.userFactory.specificUser()
    * print response = tm.reqResController.createUser(user)
    * print response

  Scenario: Create User with valid data
    * def requestBody = tm.userFactory.randomUser()
    * call read('../utils/Hooks.feature@createUser')

