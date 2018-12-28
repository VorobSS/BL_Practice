package vorobss.blpractice.dao.address;

import vorobss.blpractice.model.Address;

import java.util.List;

/**
 * DAO для работы с Address
 */
public interface AddressDao {
    /**
     * Получить все объекты Address
     *
     * @return
     */
    List<Address> all();

    /**
     * Получить Address по идентификатору
     *
     * @param id
     * @return
     */
    Address loadById(Long id);

    /**
     * Сохранить Organization
     *
     * @param address
     */
    void save(Address address);
}
