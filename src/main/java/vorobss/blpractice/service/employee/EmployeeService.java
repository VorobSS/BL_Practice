package vorobss.blpractice.service.employee;

import org.springframework.validation.annotation.Validated;
import vorobss.blpractice.view.EmployeeView;

import javax.validation.Valid;
import java.util.List;

/**
 * Сервис
 */
@Validated
public interface EmployeeService {

    /**
     * Добавить нового сотрудника в БД
     *
     * @param employee
     */
    void add(@Valid EmployeeView employee);

    /**
     * Получить список людей
     *
     * @return {@Employee}
     */
    List<EmployeeView> employees();
}

