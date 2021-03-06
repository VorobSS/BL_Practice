package vorobss.blpractice.dao.office;

import vorobss.blpractice.model.Office;

import java.util.List;

/**
 * DAO для работы с Office
 */
public interface OfficeDao {
    /**
     * Получить все объекты Office
     *
     * @return
     */
    List<Office> all();

    /**
     * Получить Office по идентификатору
     *
     * @param id
     * @return
     */
    Office loadById(Long id);


    /**
     * Сохранить Office
     *
     * @param office
     */
    void save(Office office);
}
