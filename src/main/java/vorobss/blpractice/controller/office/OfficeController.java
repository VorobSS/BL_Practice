package vorobss.blpractice.controller.office;

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
import vorobss.blpractice.service.office.OfficeService;
import vorobss.blpractice.view.OfficeView;


import java.util.List;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@Api(value = "OfficeController", description = "Управление информацией об офисе")
@RestController
@RequestMapping(value = "/", produces = APPLICATION_JSON_VALUE)
public class OfficeController {

    private final OfficeService officeService;

    @Autowired
    public OfficeController(OfficeService officeService) {
        this.officeService = officeService;
    }

    @ApiOperation(value = "Добавить новый офис", httpMethod = "POST")
    @ApiResponses(value = {
            @ApiResponse(code = 200, message = "Success", response = String.class),
            @ApiResponse(code = 404, message = "Not Found"),
            @ApiResponse(code = 500, message = "Failure")})
    @PostMapping("/office")
    public void office(@RequestBody OfficeView office) {
        officeService.add(office);
    }

    @ApiOperation(value = "Получить список всех офисов", httpMethod = "GET")
    @GetMapping("/office")
    public List<OfficeView> offices() {
        return officeService.offices();
    }
}
