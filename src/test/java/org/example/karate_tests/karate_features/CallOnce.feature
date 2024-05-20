@full
Feature: Call Once feature
  
  Background:
    * print 'background'
    * callonce read('classpath:org/example/karate_tests/karate_features/BeforeAll.feature@beforeAll')
  
  # callonce will be called only once
  
  Scenario: Test nr 1
    * print 'Test 1'
    * print myVariable
  
  Scenario: Test nr 2
    * print 'Test 2'
    * print myVariable
