package vorobss.blpractice.dao.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vorobss.blpractice.model.Employee;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * {@inheritDoc}
 */
@Repository
public class EmployeeDaoImpl implements EmployeeDao {

    private final EntityManager em;

    @Autowired
    public EmployeeDaoImpl(EntityManager em) {
        this.em = em;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Employee> all() {
        TypedQuery<Employee> query = em.createQuery("SELECT p FROM Employee p", Employee.class);
        return query.getResultList();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Employee loadById(Long id) {
        return em.find(Employee.class, id);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Employee loadByFirstName(String firstName) {
        CriteriaQuery<Employee> criteria = buildCriteria(firstName);
        TypedQuery<Employee> query = em.createQuery(criteria);
        return query.getSingleResult();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void save(Employee employee) {
        em.persist(employee);
    }

    private CriteriaQuery<Employee> buildCriteria(String firstName) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Employee> criteria = builder.createQuery(Employee.class);

        Root<Employee> employee = criteria.from(Employee.class);
        criteria.where(builder.equal(employee.get("firstName"), firstName));

        return criteria;
    }
}
