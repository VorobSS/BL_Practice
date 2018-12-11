package vorobss.blpractice.service.organization;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vorobss.blpractice.dao.organization.OrganizationDao;
import vorobss.blpractice.model.Organization;
import vorobss.blpractice.model.mapper.MapperFacade;
import vorobss.blpractice.model.Employee;
import vorobss.blpractice.view.OrganizationView;

import java.util.List;

/**
 * {@inheritDoc}
 */
@Service
public class OrganizationServiceImpl implements OrganizationService {
    private final OrganizationDao dao;
    private final MapperFacade mapperFacade;

    @Autowired
    public OrganizationServiceImpl(OrganizationDao dao, MapperFacade mapperFacade) {
        this.dao = dao;
        this.mapperFacade = mapperFacade;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Transactional
    public void add(OrganizationView view) {
        Organization organization = new Organization(view.name, view.fullName, view.inn, view.kpp, view.phone);
//        dao.save(employee);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Transactional(readOnly = true)
    public List<OrganizationView> organizations() {
        List<Organization> all = dao.all();
        return mapperFacade.mapAsList(all, OrganizationView.class);
    }
}
