@API
Feature: Trying to log in using a customer token in a query that requires an admin token..

  Background:
    # Customer kullanıcısı için token alınır
    * def myCaller = call read('classpath:callers/customer.feature')
    * def token = myCaller.token

  Scenario: When a GET request is sent to the /api/holidayList endpoint using a customer token,
  it should be verified that the status code is 404 and the response message is 'User must be admin.'

    Given url base_url
    And path 'api', 'holidayList'
    * header Accept = 'application/json'
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 404
    * print response
    Then match response.message == 'user must be admin'
