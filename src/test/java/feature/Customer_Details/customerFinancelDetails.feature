Feature: US_03 When a GET request is sent to the /api/profile/get-customer-data endpoint with valid authorization information, it should be verified that the status code returned is 200 and the message information in the response body is “success”.
  Background:
    * def myCaller = call read('classpath:callers/customerToken.feature')
    * def token = myCaller.token
    # bu 3 step ortak calıstırma adımları
    Given url base_url
    And path 'api', 'profile', 'get-customer-data'
    And header Authorization = 'Bearer ' + token

    Scenario Outline: Verify status 200 and "success" message on valid GET request to /api/profile/get-customer-data
      When method GET
      Then status 200
      And print response
      And match response.message == 'success'
      And match response.wallet_running_balance == <running_balance>
      And match response.wallet_pending_balance == <pending_balance>
      And match response.total_coupon == <total_coupon>
      And match response.total_wishlist == <total_wishlist>
      And match response.total_cancel_order == <cancel_order>
      Examples:

        | running_balance |pending_balance| total_coupon  |total_wishlist|cancel_order|
        |        200      |       0       |      0        |       12     |      0     |