$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri("file:features/SBDB_Validation.feature");
formatter.feature({
  "name": "Validate SBDB Close-Approach Data API- (https://ssd-api.jpl.nasa.gov/cad.api?)",
  "description": "",
  "keyword": "Feature"
});
formatter.background({
  "name": "Endpoint Configuration",
  "description": "",
  "keyword": "Background"
});
formatter.step({
  "name": "The endpoint is already configured",
  "keyword": "Given "
});
formatter.match({
  "location": "AproachDataValidationSteps.the_endpoint_is_already_configured()"
});
formatter.result({
  "status": "passed"
});
formatter.scenario({
  "name": "Enter a valid userId",
  "description": "",
  "keyword": "Scenario",
  "tags": [
    {
      "name": "@user1"
    },
    {
      "name": "@positive"
    }
  ]
});
formatter.step({
  "name": "I close-approach data for asteroid with following filter",
  "rows": [
    {
      "cells": [
        "key",
        "value"
      ]
    },
    {
      "cells": [
        "des",
        "433"
      ]
    },
    {
      "cells": [
        "date-min",
        "1900-01-01"
      ]
    },
    {
      "cells": [
        "date-max",
        "2100-01-01"
      ]
    },
    {
      "cells": [
        "dist-max",
        "0.2"
      ]
    }
  ],
  "keyword": "When "
});
formatter.match({
  "location": "AproachDataValidationSteps.i_closeapproach_data_for_asteroid_with_following_filter(DataTable)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "I should have the status code \"200\"",
  "keyword": "Then "
});
formatter.match({
  "location": "AproachDataValidationSteps.i_should_have_the_status_code(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "content type should be in \"JSON\" format",
  "keyword": "And "
});
formatter.match({
  "location": "AproachDataValidationSteps.content_type_should_be_in_format(String)"
});
formatter.result({
  "status": "passed"
});
formatter.step({
  "name": "the body response content should be matched",
  "rows": [
    {
      "cells": [
        "key",
        "value"
      ]
    },
    {
      "cells": [
        "count",
        "5"
      ]
    },
    {
      "cells": [
        "signature.source",
        "NASA/JPL SBDB Close Approach Data API"
      ]
    },
    {
      "cells": [
        "signature.version",
        "1.4"
      ]
    },
    {
      "cells": [
        "data[0][0]",
        "433"
      ]
    }
  ],
  "keyword": "And "
});
formatter.match({
  "location": "AproachDataValidationSteps.the_body_response_content_should_be_matched(DataTable)"
});
formatter.result({
  "status": "passed"
});
});