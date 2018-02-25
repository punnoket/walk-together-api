package com.finalproject.walktogetherapi.entities.master;

import javax.persistence.*;

@Entity
@Table(name = "education")

public class Education {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
}
