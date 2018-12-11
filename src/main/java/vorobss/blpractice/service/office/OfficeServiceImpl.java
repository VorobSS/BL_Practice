package vorobss.blpractice.service.office;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vorobss.blpractice.dao.office.OfficeDao;
import vorobss.blpractice.model.Office;
import vorobss.blpractice.model.mapper.MapperFacade;
import vorobss.blpractice.view.OfficeView;

import java.util.List;

/**
 * {@inheritDoc}
 */
@Service
public class OfficeServiceImpl implements OfficeService {
    private final OfficeDao dao;
    private final MapperFacade mapperFacade;

    @Autowired
    public OfficeServiceImpl(OfficeDao dao, MapperFacade mapperFacade) {
        this.dao = dao;
        this.mapperFacade = mapperFacade;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Transactional
    public void add(OfficeView view) {
        Office office = new Office(view.name, view.phone);
//        dao.save(office);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Transactional(readOnly = true)
    public List<OfficeView> offices() {
        List<Office> all = dao.all();
        return mapperFacade.mapAsList(all, OfficeView.class);
    }
}
