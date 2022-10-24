package com.sbdb.stepdef;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.json.simple.JSONObject;

import java.util.List;
import java.util.Map;

import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;
import static org.hamcrest.Matchers.equalTo;

public class AproachDataValidationSteps {

    private Response response;
    private RequestSpecification request;

    @Given("^The endpoint is already configured$")
    public void the_endpoint_is_already_configured() {
        request = RestAssured.given();
    }

    @When("^I close-approach data for asteroid with following filter$")
    public void i_closeapproach_data_for_asteroid_with_following_filter(DataTable table) {
        List<List<String>> data = table.asLists();
        RestAssured.baseURI = "http://localhost:8888/services/auth/login/";

        request = RestAssured.given();

        JSONObject requestParams = new JSONObject();


        for(int i = 1; i < data.size(); i++) {
            requestParams.put(data.get(i).get(0), data.get(i).get(1));
        }

        response = request .accept(ContentType.JSON)
                .contentType(ContentType.JSON) . body(requestParams).when().post("");
        response.then().log().all();
    }

    @Then("^I should have the status code \"([^\"]*)\"$")
    public void i_should_have_the_status_code(String statusCode) {
        response.then().statusCode(Integer.parseInt(statusCode));
    }

    @Then("^content type should be in \"([^\"]*)\" format$")
    public void content_type_should_be_in_format(String format) {

        if(format.equals("JSON")){
            response.then().assertThat().contentType(ContentType.JSON)
                    .and()
                    .body(matchesJsonSchemaInClasspath("sbdb-schema.json"));
        }
    }

    @Then("^the body response content should be matched$")
    public void the_body_response_content_should_be_matched(DataTable table) {

        List<List<String>> data = table.asLists();


        for(int i = 1; i < data.size(); i++) {
            response.then().assertThat().body(data.get(i).get(0), equalTo(data.get(i).get(1)));
        }
    }
}
