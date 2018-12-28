package vorobss.blpractice.dao.city;

import vorobss.blpractice.model.City;

import java.util.List;

/**
 * DAO для работы с City
 */
public interface CityDao {
    /**
     * Получить все объекты City
     *
     * @return
     */
    List<City> all();

    /**
     * Получить City по идентификатору
     *
     * @param id
     * @return
     */
    City loadById(Long id);

    /**
     * Сохранить City
     *
     * @param city
     */
    void save(City city);
}
