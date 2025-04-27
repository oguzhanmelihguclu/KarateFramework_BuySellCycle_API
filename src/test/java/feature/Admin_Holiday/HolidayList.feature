Feature: As an administrator, I should be able to access holiday data via the API connection.

  Background:
    # Admin kullanıcısı için token alınır
    * def loginRequest = { email: 'admin.oguzhan@buysellcycle.com' , password: 'Bsc.0425' }
    * url base_url
    * path 'api', 'login'
    Given request loginRequest
    When method post
    Then status 200
    * def token = response.token
    * print 'Admin Token:', token

@US007
  Scenario Outline:When a GET request is sent to the /api/holidayList endpoint with valid authorization,
  it should be verified that the status code is 200, the message is 'success', and the year and name of id(x)
  in the response body are correct.

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


  Scenario: When a GET request with invalid authorization is sent to the /api/holidayList endpoint,
  it should be verified that the status code is 401 and the response message is 'Unauthenticated.'
      # INVALID OLDUGU ICIN YAPILAMADI
    Given url base_url
    And path 'api', 'holidayList'
    And header Authorization = 'Bearer '+ token
    When method GET
    Then status 401
    * print response
    And match response.message == 'Unauthenticated.'
