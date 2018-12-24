package vorobss.blpractice.model;

import javax.persistence.*;

@Entity
@Table(name = "countrie")
public class Countrie {

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
     * НАзвание страны
     */
    @Column(name = "name", length = 100, nullable = false)
    private String name;
}
