import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import vorobss.blpractice.model.Office;

import static org.junit.jupiter.api.Assertions.*;

class OfficeControllerTest {

    @Test
    void test() {
        RestTemplate restTemplate = new RestTemplate();

        Office newOf = new Office("Первый", "951753");
        HttpEntity<Office> entity = new HttpEntity<Office>(newOf);
        ResponseEntity<Office> response = restTemplate.postForEntity(
                "http://localhost:8888/office", entity, Office.class);
        Office of = response.getBody();
        System.out.println(of.toString());
        Assert.assertEquals(newOf, of);
    }
}
