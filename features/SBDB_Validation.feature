Feature: Validate SBDB Close-Approach Data API- (https://ssd-api.jpl.nasa.gov/cad.api?)

  Background: Endpoint Configuration 
    Given The endpoint is already configured

  @SBDB @positive
  Scenario: Enter a valid userId
    When I close-approach data for asteroid with following filter
      | key     | value    |
      |des      |433       |
      |date-min |1900-01-01|
      |date-max |2100-01-01|
      |dist-max |0.2       |
    Then I should have the status code "200"
    And content type should be in "JSON" format
    And the body response content should be matched
      | key                       | value                                                   |
      | count                     | 5                                                      |
      | signature.source          | NASA/JPL SBDB Close Approach Data API                   |
      | signature.version         | 1.4                                                     |
      | data[0][0]                |433                                                     |
