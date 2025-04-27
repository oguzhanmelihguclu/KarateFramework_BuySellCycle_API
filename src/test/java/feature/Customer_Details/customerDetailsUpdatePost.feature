Feature: US_04 As a customer I should be able to edit my user information via API connection.

  Background:
    * def myCaller = call read('classpath:callers/customerToken.feature')
    * def token = myCaller.token
    # bu 3 step ortak calıstırma adımları
    Given url base_url
    And path 'api', 'change-password'
    And header Authorization = 'Bearer ' + token

    Scenario:
      * def myRequest =
      """
        {
          "old_password": "Bsc.0425",
          "password": "Bsc.04251",
          "password_confirmation": "Bsc.04251"
        }
      """

      When  request myRequest
      And method POST
      Then status 200
      And response.message == 'password change successfully'


