package vorobss.blpractice.controller.employee;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vorobss.blpractice.model.Employee;
import vorobss.blpractice.service.employee.EmployeeService;
import vorobss.blpractice.view.EmployeeView;

import java.util.List;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@Api(value = "EmployeeController", description = "Управление информацией о сотрудниках")
@RestController
@RequestMapping(value = "/", produces = APPLICATION_JSON_VALUE)
public class EmployeeController {

    private final EmployeeService employeeService;

    @Autowired
    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @ApiOperation(value = "Добавить нового сотрудника", httpMethod = "POST")
    @ApiResponses(value = {
            @ApiResponse(code = 200, message = "Success", response = String.class),
            @ApiResponse(code = 404, message = "Not Found"),
            @ApiResponse(code = 500, message = "Failure")})
    @PostMapping("/employee")
    public void employee(@RequestBody EmployeeView employee) {
        employeeService.add(employee);
    }

    @ApiOperation(value = "Получить список всех сотрудников", httpMethod = "GET")
    @GetMapping("/employee")
    public List<EmployeeView> employees() {
        return employeeService.employees();
    }
}
