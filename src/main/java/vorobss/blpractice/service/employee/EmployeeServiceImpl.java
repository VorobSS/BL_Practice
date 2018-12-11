package vorobss.blpractice.service.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vorobss.blpractice.model.mapper.MapperFacade;
import vorobss.blpractice.dao.employee.EmployeeDao;
import vorobss.blpractice.model.Employee;
import vorobss.blpractice.view.EmployeeView;

import java.util.List;

/**
 * {@inheritDoc}
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
    private final EmployeeDao dao;
    private final MapperFacade mapperFacade;

    @Autowired
    public EmployeeServiceImpl(EmployeeDao dao, MapperFacade mapperFacade) {
        this.dao = dao;
        this.mapperFacade = mapperFacade;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Transactional
    public void add(EmployeeView view) {
        Employee employee = new Employee(view.firstName, view.lastName, view.middleName, view.phone);
//        dao.save(employee);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Transactional(readOnly = true)
    public List<EmployeeView> employees() {
        List<Employee> all = dao.all();
        return mapperFacade.mapAsList(all, EmployeeView.class);
    }
}
