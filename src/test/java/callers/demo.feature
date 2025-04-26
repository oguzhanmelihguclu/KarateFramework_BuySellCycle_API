Feature: Demo caller

  Scenario: pet bölümündeki GET sorgusu yapılan API TESTI

    Given url petBaseUrl
    And path 'pet',id
    When method GET
    Then print response
    And status 404