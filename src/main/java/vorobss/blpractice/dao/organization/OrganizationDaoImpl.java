package vorobss.blpractice.dao.organization;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vorobss.blpractice.model.Organization;

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
public class OrganizationDaoImpl implements OrganizationDao {

    private final EntityManager em;

    @Autowired
    public OrganizationDaoImpl(EntityManager em) {
        this.em = em;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Organization> all() {
        TypedQuery<Organization> query = em.createQuery("SELECT p FROM Organization p", Organization.class);
        return query.getResultList();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Organization loadById(Long id) {
        return em.find(Organization.class, id);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void save(Organization organization) {
        em.persist(organization);
    }

    private CriteriaQuery<Organization> buildCriteria(String name, String fullName, int inn, int kpp,
                                                      String address, String phone, boolean isActive) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Organization> criteria = builder.createQuery(Organization.class);

        Root<Organization> organization = criteria.from(Organization.class);
        criteria.where(builder.equal(organization.get("name"), name));
        criteria.where(builder.equal(organization.get("fullName"), fullName));
        criteria.where(builder.equal(organization.get("inn"), inn));
        criteria.where(builder.equal(organization.get("kpp"), kpp));
        criteria.where(builder.equal(organization.get("address"), address));
        criteria.where(builder.equal(organization.get("phone"), phone));
        criteria.where(builder.equal(organization.get("isActive"), isActive));

        return criteria;
    }
}
