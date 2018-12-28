package vorobss.blpractice.dao.countrie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vorobss.blpractice.model.Countrie;

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
public class CountrieDaoImpl implements CountrieDao {
    private final EntityManager em;

    @Autowired
    public CountrieDaoImpl(EntityManager em) {
        this.em = em;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Countrie> all() {
        TypedQuery<Countrie> query = em.createQuery("SELECT p FROM Countrie p", Countrie.class);
        return query.getResultList();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Countrie loadById(Long id) {
        return em.find(Countrie.class, id);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void save(Countrie countrie) {
        em.persist(countrie);
    }

    private CriteriaQuery<Countrie> buildCriteria(String name, String fullName, int inn, int kpp
    ) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Countrie> criteria = builder.createQuery(Countrie.class);

        Root<Countrie> countrie = criteria.from(Countrie.class);
        criteria.where(builder.equal(countrie.get("name"), name));
        criteria.where(builder.equal(countrie.get("fullName"), fullName));
        criteria.where(builder.equal(countrie.get("inn"), inn));
        criteria.where(builder.equal(countrie.get("kpp"), kpp));


        return criteria;
    }
}
