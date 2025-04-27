Feature: Trying to log in using a customer token in a query that requires an admin token.

  Background:
    # Customer kullanıcısı için token alınır
    * def loginRequest = { email: 'customer.oguzhan@gmail.com' , password: 'Bsc.0425' }
    * url base_url
    * path 'api', 'login'
    Given request loginRequest
    When method post
    Then status 200
    * def token = response.token
    * print 'Customer Token:', token

  Scenario: When a GET request is sent to the /api/holidayList endpoint using a customer token,
  it should be verified that the status code is 404 and the response message is 'User must be admin.'

    Given url base_url
    And path 'api', 'holidayList'
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 404
    * print response
    Then match response.message == 'user must be admin'
