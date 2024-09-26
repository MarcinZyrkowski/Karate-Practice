Feature: Before all feature

  Background:
    * def Waiter = Java.type('org.example.utils.Waiter')

  @ignore
  @beforeAll
  Scenario: Before all - call once
    * print 'TEST BEGINNING - before all'
    * def myVariable = 'my variable'
    * Waiter.makeDelay()
