package vorobss.blpractice.dao.organization;

import vorobss.blpractice.model.Organization;

import java.util.List;

/**
 * DAO для работы с Organization
 */
public interface OrganizationDao {
    /**
     * Получить все объекты Organization
     *
     * @return
     */
    List<Organization> all();

    /**
     * Получить Organization по идентификатору
     *
     * @param id
     * @return
     */
    Organization loadById(Long id);

    /**
     * Получить Organization по имени
     *
     * @param name
     * @return
     */
    Organization loadByName(String name);

    /**
     * Сохранить Organization
     *
     * @param organization
     */
    void save(Organization organization);
}
