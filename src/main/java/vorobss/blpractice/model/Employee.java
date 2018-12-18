package vorobss.blpractice.model;

import vorobss.blpractice.view.EmployeeView;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Version;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

/**
 * Сотрудник
 */
@Entity
@Table(name = "employee")
public class Employee {

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
     * Иия
     */
    @Column(name = "first_name", length = 50, nullable = false)
    private String firstName;

    /**
     * Фамилия
     */
    @Column(name = "last_name", length = 50, nullable = false)
    private String lastName;

    /**
     * Отчество
     */
    @Column(name = "middle_name", length = 50, nullable = false)
    private String middleName;

    /**
     * Номер телефона
     */
    @Column(name = "phone")
    private String phone;

    @ManyToMany(
            cascade = {
                    CascadeType.PERSIST,
                    CascadeType.MERGE
            }
    )
    @JoinTable(
            name = "employee_office",
            joinColumns = @JoinColumn(name = "employee_id"),
            inverseJoinColumns = @JoinColumn(name = "office_id")
    )
    private Set<Office> offices;

    /**
     * Конструктор для hibernate
     * @param firstName
     * @param lastName
     */
    public Employee(@Size(max = 50) @NotEmpty(message = "name cannot be null") String firstName, @Size(max = 50) @NotEmpty(message = "name cannot be null") String lastName) {

    }

    public Employee(String firstName, String lastName, String middleName, String phone) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.middleName = middleName;
        this.phone = phone;
    }

    public Long getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Set<Office> getOffices() {
        if (offices == null) {
            offices = new HashSet<>();
        }
        return offices;
    }

    public void addOffice(Office office) {
        getOffices().add(office);
        office.getEmployees().add(this);
    }

    public void removeOffice(Office office) {
        getOffices().remove(office);
        office.getEmployees().remove(this);
    }

}
