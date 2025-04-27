Feature: As an administrator, I want to add a new holiday record via the API connection.

  Background:
    * def loginRequest = { email: 'admin.oguzhan@buysellcycle.com', password: 'Bsc.0425' }
    * url base_url
    * path 'api', 'login'
    Given request loginRequest
    When method post
    Then status 200
    * def token = response.token
    * print 'Admin Token:', token

    # burası ortak kullanılan 3 step
    Given url base_url
    And path 'api','holidayAdd'
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


