import io.restassured.RestAssured;
import io.restassured.specification.RequestSpecification;
import org.json.JSONObject;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import vorobss.blpractice.model.Employee;
import vorobss.blpractice.model.Organization;

import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

class OrganizationControllerTest {

    @Test
    void test() {

        String someRandomString = String.format("%1$TH%1$TM%1$TS", new Date());

        JSONObject requestBody = new JSONObject();
        requestBody.put("name", someRandomString);
        requestBody.put("fullName", someRandomString);
        requestBody.put("inn", someRandomString);
        requestBody.put("kpp", someRandomString);
        requestBody.put("phone", someRandomString);
        requestBody.put("isActive", true);

        RequestSpecification request = RestAssured.given();
        request.header("Content-Type", "application/json");
        request.body(requestBody.toString());

        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<Organization> response = restTemplate.postForEntity(
                "http://localhost:8888/organization", request, Organization.class);
        Organization o = response.getBody();
        Assert.assertEquals(requestBody.toString(), o.toString());
    }
    }
