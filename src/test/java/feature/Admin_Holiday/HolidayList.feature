
Feature: As an administrator, I should be able to access holiday data via the API connection.

  Background:
    # Admin kullanıcısı için token alınır
    * def loginRequest = { email: admin.oguzhan@buysellcycle.com , password: Bsc.0425 }
    * url base_url
    * path 'api', 'login'
    Given request loginRequest
    When method post
    Then status 200
    * def token = response.token
    * print 'Admin Token:', token

  Scenario Outline: Verify holiday list with admin token
    Given url base_url
    And path 'api', 'holidayList'
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 200
    * print response
    And match response.message == 'success'
    And match response.holiday[<dataIndex>].year == '<year>'
    And match response.holiday[<dataIndex>].name == '<name>'

    Examples:
      | dataIndex | year | name   |
      | 0         | 2025 | Spring |
