package vorobss.blpractice.service.organization;

import org.springframework.validation.annotation.Validated;
import vorobss.blpractice.view.OrganizationView;

import javax.validation.Valid;
import java.util.List;

/**
 * Сервис
 */
@Validated
public interface OrganizationService {

    /**
     * Добавить нового сотрудника в БД
     *
     * @param organization
     */
    void add(@Valid OrganizationView organization);

    /**
     * Получить список организаций
     *
     * @return {@Organization}
     */
    List<OrganizationView> organizations();
}
