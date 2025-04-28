@API
Feature: As an administrator, I want to be able to delete
  the holiday information with the specified id number via the API connection.

  Background:
    # Admin kullanıcısı için token alınır
    * def myCaller = call read('classpath:callers/adminToken.feature')
    * def token = myCaller.token

    # Bu 1 step tüm testlerde ortak kullanılıyor
    Given url base_url
    And path 'api' , 'holidayDelete'

  Scenario: When a DELETE request with valid authorization and a holiday ID is sent to the /api/holidayDelete endpoint, it
  should be verified that the status code is 202, the response message is 'holiday deleted successfully', and the deleted_Id
  in the response body matches the ID in the request body.

    * def myRequestBody = { id : 194 }
    When request myRequestBody
    And header Authorization = 'Bearer ' + token
    And method DELETE
    Then status 202
    Then response.message == 'holiday deleted successfully'
    Then response.Deleted_Id == 192

  Scenario:  DELETE body containing valid authorization information and an incorrect (non-existent) holiday id is sent
  to the /api/holidayDelete endpoint, it should be verified that the returned status code is 404 and the message information
  in the response body is "holiday not found".

    * def myRequestBody = { id : 195 }
    When request myRequestBody
    And header Authorization = 'Bearer ' + token
    And method DELETE
    Then status 404
    Then response.message == 'holiday not found'
