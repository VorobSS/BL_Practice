package vorobss.blpractice.dao.employee;

import vorobss.blpractice.model.Employee;

import java.util.List;

/**
 * DAO для работы с Employee
 */
public interface EmployeeDao {
    /**
     * Получить все объекты Employee
     *
     * @return
     */
    List<Employee> all();

    /**
     * Получить Employee по идентификатору
     *
     * @param id
     * @return
     */
    Employee loadById(Long id);

    /**
     * Получить Employee по имени
     *
     * @param firstName
     * @return
     */
    Employee loadByFirstName(String firstName);

    /**
     * Сохранить Employee
     *
     * @param employee
     */
    void save(Employee employee);
}
