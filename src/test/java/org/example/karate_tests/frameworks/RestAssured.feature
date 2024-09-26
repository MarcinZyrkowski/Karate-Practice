@full
Feature: Rest Assured

  Background:
    * def ReqResController = Java.type('org.example.controller.ReqResController')

  Scenario: Rest Assured integration - get
    * def singleUser = ReqResController.getSingleUser(2)
    * print singleUser
    * print karate.toJson(singleUser)

  Scenario: Rest Assured integration - post
    * def UserGenerator = Java.type('org.example.data_provider.UserGenerator')
    * print user = UserGenerator.generateUserDto()
    * print ReqResController.createUser(user)
