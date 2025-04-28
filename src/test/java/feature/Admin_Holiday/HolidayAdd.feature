@API
Feature: As an administrator, I want to add a new holiday record via the API connection.

  Background:
    * def myCaller = call read('classpath:callers/adminToken.feature')
    * def token = myCaller.token

    # burası ortak kullanılan 3 step
    Given url base_url
    And path 'api','holidayAdd'
    * header Accept = 'application/json'
    And header Authorization = 'Bearer ' + token

  Scenario: When a POST request with valid authorization and holiday data (year, name, date) is sent to the /api/holidayAdd
  endpoint, it should be verified that the status code is 201 and the response message is 'holiday added successfully'.

    * def myRequestBody = read('classpath:data/HolidayAdd.json')
    And request myRequestBody
    When method POST
    * print response
    Then status 201
    Then match response.message == 'holiday added successfully'


  Scenario:
    * def myRequestBody = read('classpath:data/HolidayAdd.json')
    And request myRequestBody
    When method POST
    * print response
    Then status 400
    Then match response.message == 'dublicate holiday request'


