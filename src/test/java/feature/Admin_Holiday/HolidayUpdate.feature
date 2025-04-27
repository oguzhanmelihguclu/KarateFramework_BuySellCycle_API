@API
Feature: As an administrator, I want to be able to update the holiday
  information with the specified id number via the API connection.

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

    # Bu 1 step tüm testlerde ortak kullanılıyor
    Given url base_url

  Scenario:  PATCH request with valid authorization and updated holiday data (year, name, date) is sent to the
  /api/holidayUpdate/{id} endpoint, it should be verified that the status code is 202, the response message is
  'holiday updated successfully', and the updated_Id in the response body matches the ID in the path parameter.

    When path 'api' , 'holidayUpdate' , '190'
    And header Authorization = 'Bearer ' + token
    * def myRequestBody = read('classpath:data/HolidayUpdate.json')
    And request myRequestBody
    And method PATCH
    * print response
    Then status 202
    Then match response.message == 'holiday updated successfully'
    Then match response.updated_Id == 190


  Scenario: PATCH body containing the holiday id to be updated with valid authorization information and holiday data
  (year, name, date) matching previous records is sent to the /api/holidayUpdate/{id} endpoint, it should be verified that
  the returned status code is 400 and the message information in the response body is "duplicate holiday request".

    When path 'api' , 'holidayUpdate' , '190'
    And header Authorization = 'Bearer ' + token
    * def myRequestBody = read('classpath:data/HolidayUpdate.json')
    And request myRequestBody
    And method PATCH
    * print response
    Then status 400
    Then match response.message == 'dublicate holiday request'







