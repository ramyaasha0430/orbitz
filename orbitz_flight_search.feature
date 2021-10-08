Feature: Orbitz Flight Search functionality

  Scenario: verify user is able to search the available flights for a future dates
    Given user is on the orbitz homepage
    When user selects the flights tab
    And user selects the round trip option
    And user search for "Columbus" city and selects "CMH" airport for departure
    And user search for "Cleveland" city and selects "CLE" airport for arrival
    And user choose future dates for the arrival and departure dates
    And search for the available flights
    Then verify user should see the available flights
    And user gets the flights results for the selected departure date
    Examples:

  Scenario: verify user is able to search the available flights for a future dates in declarative style
    Given user is on the orbitz homepage
    When user search for the available flights for the future dates
    Then verify user should see the available flights
    And user gets the flights results for the selected departure date

  Scenario Outline: verify user is able to search the available flights for a future dates for different destinations
    Given user is on the orbitz homepage
    When user selects the flights tab
    And user selects the round trip option
    And user search for <dep_city_name> city and selects <dep_airport_name> airport for departure
    And user search for <arr_city_name> city and selects <arr_airport_name> airport for arrival
    And user choose future dates for the arrival and departure dates
    And search for the available flights
    Then verify user should see the available flights
    And user gets the flights results for the selected departure date

    Examples:
    |dep_city_name|dep_airport_name|arr_city_name|arr_airport_name|
    |Columbus     |CMH             |Cleveland    |CLE             |
    |Chicago      |ORD             |Columbus     |CMH             |

    Scenario: verify user is able to validate the mandatory search fields for flight search
      Given user is on the orbitz homepage
      When user selects the flights tab
      And user selects the round trip option
      And user choose future dates for the arrival and departure dates
      And search for the available flights
      Then user should see the following "Please select the destination" error message

  Scenario: verify user is able to validate ALL the mandatory search fields for flight search
    Given user is on the orbitz homepage
    When user selects the flights tab
    And user selects the round trip option
    And user choose future dates for the arrival and departure dates
    And search for the available flights
    Then user should see the following error message
    |error message 1|
    |error message 2|
    |error message 3|