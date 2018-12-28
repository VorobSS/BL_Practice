package vorobss.blpractice.model;

import javax.persistence.*;

@Entity
@Table(name = "city")
public class City {
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
     * НАзвание города
     */
    @Column(name = "name", length = 100, nullable = false)
    private String name;

    public City() {

    }

    public City(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }
}
