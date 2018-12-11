package vorobss.blpractice.view;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@ApiModel(description = "Организация")
public class OrganizationView {

    @NotEmpty
    @ApiModelProperty(value = "Уникальный идентификатор", hidden = true, example = "1")
    public String id;

    @Size(max = 100)
    @NotEmpty(message = "name cannot be null")
    @ApiModelProperty(value = "Наименование", example = "ООО Ромашка")
    public String name;

    @Size(max = 200)
    @NotEmpty(message = "name cannot be null")
    @ApiModelProperty(value = "Полное наименование", example = "Общество с ограниченной ответственностью Ромашка")
    public String fullName;

    @Size(max = 15)
    @NotEmpty(message = "name cannot be null")
    @ApiModelProperty(value = "ИНН", example = "123456789")
    public int inn;

    @Size(max = 15)
    @NotEmpty(message = "name cannot be null")
    @ApiModelProperty(value = "КПП", example = "123456789")
    public int kpp;

    @Size(max = 50)
    @ApiModelProperty(value = "Номер телефона", example = "8-999-888-77-66")
    public String phone;

    @Override
    public String toString() {
        return "{id:" + id + ";name:" + name + ";fullName:" + fullName +
                ";inn:" + inn + ";kpp:" + kpp + ";phone:" + phone + "}";
    }
}
