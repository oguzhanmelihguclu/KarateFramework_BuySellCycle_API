@API
Feature: As an administrator, I should be able to access the detailed
  information of the holiday with the specified id number via the API connection.

  Background:
    * def myCaller = call read('classpath:callers/adminToken.feature')
    * def token = myCaller.token

    # burası ortak kullanılan 3 step
    Given url base_url
    And path 'api','holidayDetails'
    * header Accept = 'application/json'

  Scenario Outline: Verify GET /api/holidayDetails returns correct data

    * def myRequestBody = read('classpath:data/HolidayDetails.json')
    And request myRequestBody
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 200
    * print response
    And match response.holidayDetails[0].id == <id>
    And match response.holidayDetails[0].year == '<year>'
    And match response.holidayDetails[0].name == '<name>'
    And match response.holidayDetails[0].type == <type>
    And match response.holidayDetails[0].date == '<date>'
    And match response.holidayDetails[0].created_at == '<created_at>'
    And match response.holidayDetails[0].updated_at == '<updated_at>'

    Examples:
      | id  | year | name  | type | date       | created_at                  | updated_at                  |
      | 179 | 2024 | Noel | 0    | 2024-01-51 | 2025-04-25T17:23:56.000000Z | 2025-04-27T14:22:50.000000Z |

  Scenario: When a GET request is sent to the /api/holidayDetails endpoint with valid authorization information and no data
  (holiday id), it must be verified that the returned status code is 404 and the message information in the response body is
  "holiday not found".

    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 404
    And match response.message == 'holiday not found'

