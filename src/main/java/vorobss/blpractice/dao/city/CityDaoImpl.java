package vorobss.blpractice.dao.city;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vorobss.blpractice.model.City;

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
public class CityDaoImpl implements  CityDao {
    private final EntityManager em;

    @Autowired
    public CityDaoImpl(EntityManager em) {
        this.em = em;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<City> all() {
        TypedQuery<City> query = em.createQuery("SELECT p FROM City p", City.class);
        return query.getResultList();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public City loadById(Long id) {
        return em.find(City.class, id);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void save(City city) {
        em.persist(city);
    }

    private CriteriaQuery<City> buildCriteria(String name, String fullName, int inn, int kpp
    ) {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<City> criteria = builder.createQuery(City.class);

        Root<City> city = criteria.from(City.class);
        criteria.where(builder.equal(city.get("name"), name));
        criteria.where(builder.equal(city.get("fullName"), fullName));
        criteria.where(builder.equal(city.get("inn"), inn));
        criteria.where(builder.equal(city.get("kpp"), kpp));


        return criteria;
    }
}
