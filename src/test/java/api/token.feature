Feature: Generate token

  Background:
    * url base_url
    * path 'api', 'login'

  Scenario Outline: Login and get token
    Given request { email: '<email>', password: '<password>' }
    When method post
    Then status 200
    * def token = response.token
    * print 'Token:', token

    Examples:
      | email                          | password |
      | admin.oguzhan@buysellcycle.com | Bsc.0425 |
      | customer.oguzhan@gmail.com     | Bsc.0425 |
