import org.json.JSONObject;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import vorobss.blpractice.model.Employee;

import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
//import org.json.JSONObject;
//import org.testng.Assert;
//import org.testng.annotations.Test;

import java.util.Date;


public class EmployeeControllerTest {

    @Test
    public void test() {

        String someRandomString = String.format("%1$TH%1$TM%1$TS", new Date());

        JSONObject requestBody = new JSONObject();
        requestBody.put("FirstName", someRandomString);
        requestBody.put("LastName", someRandomString);
        requestBody.put("MiddleName", someRandomString);
        requestBody.put("Phone", someRandomString);

        RequestSpecification request = RestAssured.given();
        request.header("Content-Type", "application/json");
        request.body(requestBody.toString());

        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<Employee> response = restTemplate.postForEntity(
                "http://localhost:8888/employee", request, Employee.class);
        Employee e = response.getBody();
        Assert.assertEquals(requestBody.toString(), e.toString());
    }
}