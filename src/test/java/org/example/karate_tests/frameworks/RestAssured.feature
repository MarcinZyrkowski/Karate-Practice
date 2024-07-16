@full
Feature: Rest Assured
  
  Background:
    * def ReqResController = Java.type('org.example.controller.ReqResController')
    
  Scenario: Rest Assured logging
    * def singleUser = ReqResController.getSingleUser(2)
    * print singleUser
    * print karate.toJson(singleUser)
    
