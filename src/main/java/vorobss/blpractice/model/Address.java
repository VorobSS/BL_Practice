package vorobss.blpractice.model;

import javax.persistence.*;

@Entity
@Table(name = "address")
public class Address {

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
     * НАзвание улицы
     */
    @Column(name = "street", length = 100, nullable = false)
    private String street;

    /**
     * Номер дома/строения
     */
    @Column(name = "house", length = 50, nullable = false)
    private String house;

    private Long city;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "city", referencedColumnName = "id")
    public Long getCity() {
        return this.city;
    }

    public void setCity(Сity city) {
        this.city = city.getId();
    }

    private Long countrie;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "countrie", referencedColumnName = "id")
    public Long getCountrie() {
        return this.countrie;
    }

    public void setCountrie(Countrie countrie) {
        this.countrie = countrie.getId();
    }

    @OneToOne(cascade = CascadeType.ALL)
    @PrimaryKeyJoinColumn
    private Office office;

    public Address() {

    }

    public Address(String street, String house) {
        this.street = street;
        this.house = house;
    }

    public Long getId() {
        return id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house;
    }

}
