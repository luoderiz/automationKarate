@Post @Shorten
Feature: Test service for link shortening ("create new short URL from a long URL")

  Background:
    Given url 'https://url-shortener-service.p.rapidapi.com'
    And path 'shorten'

  @Success
  Scenario: Success to shorten url

    And header x-rapidapi-key = "5bc1a34c40mshe27d32ebba28f93p1f3a18jsn222d7956a53b"
    And request { "url": "https://crowdar.com.ar" }
    When method post
    Then status 200
    And match response == { "result_url": "#string" }


  @Fail @NoBody
  Scenario: Fail to shorten, because of missing Body

    And header x-rapidapi-key = "5bc1a34c40mshe27d32ebba28f93p1f3a18jsn222d7956a53b"
    And request { }
    When method post
    Then status 400
    And match response == { "error": "API Error: URL is empty" }


  @Fail @InvalidUrl
  Scenario: Fail to shorten url, because of invalid URL

    And header x-rapidapi-key = "5bc1a34c40mshe27d32ebba28f93p1f3a18jsn222d7956a53b"
    And request { "url": "sdfadfadsfdfsdf" }
    When method post
    Then status 400
    And match response == { "error": "API Error: URL is invalid (check #1)" }


  @Fail @InvalidToken
  Scenario: Fail to shorten url, because of invalid Token

    And header x-rapidapi-key = "asdasdas"
    And request { "url": "https://crowdar.com.ar" }
    When method post
    Then status 403
    And match response == { "message": "You are not subscribed to this API." }