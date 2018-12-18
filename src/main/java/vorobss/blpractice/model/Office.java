package vorobss.blpractice.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

public class Office {

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
     * Номер телефона офиса
     */
    @Column(name = "phone")
    private String phone;

    @ManyToMany(mappedBy = "employee")
    private Set<Employee> employees;

    public Office(String name, String phone) {
        this.name = name;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Set<Employee> getEmployees() {
        if (employees == null) {
            employees = new HashSet<>();
        }
        return employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }
}
