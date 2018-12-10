package vorobss.blpractice.view;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@ApiModel(description = "Сотрудник")
public class EmployeeView {

    @NotEmpty
    @ApiModelProperty(value = "Уникальный идентификатор", hidden = true, example = "1")
    public String id;

    @Size(max = 50)
    @NotEmpty(message = "name cannot be null")
    @ApiModelProperty(value = "Имя", example = "Иван")
    public String firstName;

    @Size(max = 50)
    @NotEmpty(message = "name cannot be null")
    @ApiModelProperty(value = "Фамилия", example = "Иванов")
    public String lastName;

    @Size(max = 50)
    @NotEmpty(message = "name cannot be null")
    @ApiModelProperty(value = "Отчество", example = "Иванович")
    public String middleName;

    @Size(max = 50)
    @ApiModelProperty(value = "Номер телефона", example = "8-999-888-77-66")
    public String phone;

    @Override
    public String toString() {
        return "{id:" + id + ";firstName:" + firstName + ";lastName:" + lastName +
                ";middleName:" + middleName + ";phone:" + phone + "}";
    }
}

