import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import vorobss.blpractice.model.Employee;


public class EmployeeControllerTest {

    @Test
    public void test() {
        RestTemplate restTemplate = new RestTemplate();

        Employee newEmp = new Employee("Олегов", "Олегов", "Олегов", "951753");
        HttpEntity<Employee> entity = new HttpEntity<Employee>(newEmp);
        ResponseEntity<Employee> response = restTemplate.postForEntity(
                "http://localhost:8888/employee", entity, Employee.class);
        Employee e = response.getBody();
        System.out.println(e.toString());
        Assert.assertEquals(newEmp, e);
    }
}