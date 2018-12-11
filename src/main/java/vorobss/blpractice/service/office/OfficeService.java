package vorobss.blpractice.service.office;

import org.springframework.validation.annotation.Validated;
import vorobss.blpractice.view.OfficeView;

import javax.validation.Valid;
import java.util.List;

/**
 * Сервис
 */
@Validated
public interface OfficeService {

    /**
     * Добавить новый офис в БД
     *
     * @param office
     */
    void add(@Valid OfficeView office);

    /**
     * Получить список офисов
     *
     * @return {@Office}
     */
    List<OfficeView> offices();
}
