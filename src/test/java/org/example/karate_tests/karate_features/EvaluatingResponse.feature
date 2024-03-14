@full
Feature: Evaluating response

 Background:
  * url baseURL

  Scenario: Verifying if one element is present in response
    Given path '/api/unknown'
    When method GET
    Then status 200
    And print response
    And def expectedResponse =
    """
        {
            "id": 1,
            "name": "cerulean",
            "year": 2000,
            "color": "#98B2D1",
            "pantone_value": "15-4020"
        }
    """
    And match response.data contains expectedResponse

  Scenario: Verifying if part of response is exactly the same as expected
    Given path '/api/unknown/2'
    When method GET
    Then status 200
    And print response
    And def expectedPartOfResponse =
    """
    {
       "url": "https://reqres.in/#support-heading",
       "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
    }
    """
    And match response.support contains only expectedPartOfResponse

  Scenario: Verifying whole response
    Given path '/api/unknown/2'
    When method GET
    Then status 200
    And print response
    And def expectedPartOfResponse =
    """
    {
      "data": {
        "id": 2,
        "name": "fuchsia rose",
        "year": 2001,
        "color": "#C74375",
        "pantone_value": "17-2031"
      },
      "support": {
        "url": "https://reqres.in/#support-heading",
        "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
      }
    }
    """
    And match response == expectedPartOfResponse
