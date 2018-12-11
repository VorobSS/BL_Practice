package vorobss.blpractice.view;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@ApiModel(description = "Офис")
public class OfficeView {

    @NotEmpty
    @ApiModelProperty(value = "Уникальный идентификатор", hidden = true, example = "1")
    public String id;

    @Size(max = 100)
    @NotEmpty(message = "name cannot be null")
    @ApiModelProperty(value = "Наименование", example = "Офис номер один")
    public String name;

    @Size(max = 50)
    @ApiModelProperty(value = "Номер телефона", example = "8-999-888-77-66")
    public String phone;

    @Override
    public String toString() {
        return "{id:" + id + ";name:" + name + ";phone:" + phone + "}";
    }
}
