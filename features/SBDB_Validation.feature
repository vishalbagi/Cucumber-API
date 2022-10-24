Feature: Validate SBDB Close-Approach Data API- (https://ssd-api.jpl.nasa.gov/cad.api?)

  Background: Endpoint Configuration 
    Given The endpoint is already configured

  @SBDB @positive
  Scenario: Enter a valid userId
    When I close-approach data for asteroid with following filter
      | key     | value    |
      |userName      |master       |
      |password |secret|
    Then I should have the status code "200"
