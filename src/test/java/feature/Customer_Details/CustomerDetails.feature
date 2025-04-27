Feature: US_02 When a GET request is sent to /api/customerGetUser endpoint with valid authorization information, it should be verified that the status code returned is 200 and the message information in the response body is “success”.

  Background:
    * def myCaller = call read('classpath:callers/customerToken.feature')
    * def token = myCaller.token
    # bu 3 step ortak calıstırma adımları
    Given url base_url
    And path 'api', 'customerGetUser'
    And header Authorization = 'Bearer ' + token

  Scenario Outline: Verify 200 status and "success" message with valid token on /api/customerGetUser
    When method GET
    Then status 200
    And print response
    And match response.message == 'success'
    And match response.user.first_name == '<firstname>'
    And match response.user.last_name == '<lastname>'
    And match response.user.email == '<email>'
    Examples:

      | firstname | lastname |            email           |
      | Oğuzhan   | Güçlü    | customer.oguzhan@gmail.com |





