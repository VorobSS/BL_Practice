package vorobss.blpractice.dao.countrie;

import vorobss.blpractice.model.Countrie;

import java.util.List;

/**
 * DAO для работы с Countrie
 */
public interface CountrieDao {
    /**
     * Получить все объекты Countrie
     *
     * @return
     */
    List<Countrie> all();

    /**
     * Получить Countrie по идентификатору
     *
     * @param id
     * @return
     */
    Countrie loadById(Long id);

    /**
     * Сохранить Countrie
     *
     * @param countrie
     */
    void save(Countrie countrie);
}
