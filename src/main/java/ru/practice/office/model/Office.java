package ru.practice.office.model;

import ru.practice.organization.model.Organization;
import ru.practice.user.model.User;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "office")
public class Office {

    @Id
    @GeneratedValue
    private Long id;

    @Version
    private Integer version;
    private String name;
    private String address;
    private String phone;

    @Column(name = "is_active")
    private Boolean isActive;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "organization_id")

    private Organization organization;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "office",
            cascade = {CascadeType.PERSIST, CascadeType.MERGE})

    private List<User> users;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    @Override
    public String toString() {
        return "Office{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", isActive=" + isActive +
                '}';
    }
}
