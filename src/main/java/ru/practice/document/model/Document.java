package ru.practice.document.model;

import javax.persistence.*;

@Entity
@Table(name = "document")
public class Document {

    @Id
    @GeneratedValue
    private Long id;

    @Version
    private Integer version;

    private String name;
    private String code;

    public Document() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "Document{" +
                "name='" + name + '\'' +
                ", code='" + code + '\'' +
                '}';
    }
}
