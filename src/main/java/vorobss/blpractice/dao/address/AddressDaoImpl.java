package vorobss.blpractice.dao.address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vorobss.blpractice.model.Address;
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
public class AddressDaoImpl implements  AddressDao {
    private final EntityManager em;

    @Autowired
    public AddressDaoImpl(EntityManager em) {
        this.em = em;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Address> all() {
        TypedQuery<Address> query = em.createQuery("SELECT p FROM Address p", Address.class);
        return query.getResultList();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Address loadById(Long id) {
        return em.find(Address.class, id);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void save(Address address) {
        em.persist(address);
    }

    private CriteriaQuery<Address> buildCriteria(String name, String fullName, int inn, int kpp
                                                      ) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Address> criteria = builder.createQuery(Address.class);

        Root<Address> address = criteria.from(Address.class);
        criteria.where(builder.equal(address.get("name"), name));
        criteria.where(builder.equal(address.get("fullName"), fullName));
        criteria.where(builder.equal(address.get("inn"), inn));
        criteria.where(builder.equal(address.get("kpp"), kpp));


        return criteria;
    }
}
