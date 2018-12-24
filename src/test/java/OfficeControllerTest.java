import io.restassured.RestAssured;
import io.restassured.specification.RequestSpecification;
import org.json.JSONObject;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import vorobss.blpractice.model.Employee;
import vorobss.blpractice.model.Office;

import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

class OfficeControllerTest {

    @Test
    void test() {
        String someRandomString = String.format("%1$TH%1$TM%1$TS", new Date());

        JSONObject requestBody = new JSONObject();
        requestBody.put("name", someRandomString);
        requestBody.put("phone", someRandomString);

        RequestSpecification request = RestAssured.given();
        request.header("Content-Type", "application/json");
        request.body(requestBody.toString());

        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<Office> response = restTemplate.postForEntity(
                "http://localhost:8888/office", request, Office.class);
        Office o = response.getBody();
        Assert.assertEquals(requestBody, o);
    }
}
