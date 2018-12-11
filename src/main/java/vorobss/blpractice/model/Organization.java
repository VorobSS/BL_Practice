package vorobss.blpractice.model;

import javax.persistence.*;

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
    private int inn;

    /**
     * КПП
     */
    @Column(name = "kpp", length = 15, nullable = false)
    private int kpp;

    /**
     * Номер телефона организации
     */
    @Column(name = "phone")
    private String phone;

    public Organization(String name, String fullName, int inn, int kpp, String phone) {
        this.name = name;
        this.fullName = fullName;
        this.inn = inn;
        this.kpp = kpp;
        this.phone = phone;
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

    public int getInn() {
        return inn;
    }

    public void setInn(int inn) {
        this.inn = inn;
    }

    public int getKpp() {
        return kpp;
    }

    public void setKpp(int kpp) {
        this.kpp = kpp;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
