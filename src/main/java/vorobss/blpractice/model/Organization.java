package vorobss.blpractice.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "organization")
public class Organization {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    /**
     * Служебное поле hibernate
     */
    @Version
    private Integer version;

    /**
     * Наименование
     */
    @Column(name = "name", length = 100, nullable = false)
    private String name;

    /**
     * Полное наименование
     */
    @Column(name = "full_name", length = 100, nullable = false)
    private String fullName;

    /**
     * ИНН
     */
    @Column(name = "inn", length = 15, nullable = false)
    private String inn;

    /**
     * КПП
     */
    @Column(name = "kpp", length = 15, nullable = false)
    private String kpp;

    /**
     * Номер телефона организации
     */
    @Column(name = "phone")
    private String phone;

    /**
     * Адрес организации
     */
//    @Column(name = "address")
//    private long address;

    /**
     * Активна
     */
    @Column(name = "is_active")
    private boolean isActive;

//    private Set<Office> offices = new HashSet<>();

//    //@OneToMany(targetEntity = Office.class, mappedBy = "organization", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//    @Access(AccessType.PROPERTY)
//    @OneToMany(targetEntity = Office.class, cascade = CascadeType.ALL, orphanRemoval=true)
//    //@JoinColumn(name = "org_id")
//    public Set<Office> getOffices() {
//        return this.offices;
//    }
//
//    public void setOffices(Set<Office> offices) {
//        this.offices = offices;
//    }
//
//    public void addOffice(Office office) {
//        office.setOrganization(this);
//        getOffices().add(office);
//    }
//
//    public void removeOffice(Office office) {
//        getOffices().remove(office);
//    }

    /**
     * Конструктор для hibernate
     */
    public Organization() {

    }

    public Organization(String name, String fullName, String inn, String kpp, String phone, boolean isActive) {
        this.name = name;
        this.fullName = fullName;
        this.inn = inn;
        this.kpp = kpp;
        this.phone = phone;
        //this.address = address;
        this.isActive = isActive;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getInn() {
        return inn;
    }

    public void setInn(String inn) {
        this.inn = inn;
    }

    public String getKpp() {
        return kpp;
    }

    public void setKpp(String kpp) {
        this.kpp = kpp;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
