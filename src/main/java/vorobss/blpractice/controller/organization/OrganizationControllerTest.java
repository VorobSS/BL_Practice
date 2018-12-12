package vorobss.blpractice.controller.organization;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import vorobss.blpractice.model.Organization;

import static org.junit.jupiter.api.Assertions.*;

class OrganizationControllerTest {

    @Test
    void test() {
        RestTemplate restTemplate = new RestTemplate();

        Organization newOrg = new Organization("ООО Новая Организация", "Общество с ограниченной ответственностью Новая Организация",
                123654, 987456, "456951753");
        HttpEntity<Organization> entity = new HttpEntity<Organization>(newOrg);
        ResponseEntity<Organization> response = restTemplate.postForEntity(
                "http://localhost:8888/organization", entity, Organization.class);
        Organization org = response.getBody();
        System.out.println(org.toString());
        Assert.assertEquals(newOrg, org);
    }
    }
