package com.finalproject.walktogetherapi.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "Collection")
public class Collection {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private Patient patient;
    @ManyToOne
    private Reward reward;

    @Column(nullable = false, columnDefinition = "boolean default false")
    private Boolean isReceive;

    @Column(nullable = false, columnDefinition = "boolean default false")
    private Boolean isLock;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @JsonIgnore
    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Reward getReward() {
        return reward;
    }

    public void setReward(Reward reward) {
        this.reward = reward;
    }

    public Boolean isReceive() {
        return isReceive;
    }

    public void setReceive(Boolean receive) {
        isReceive = receive;
    }

    public Boolean isLock() {
        return isLock;
    }

    public void setLock(Boolean lock) {
        isLock = lock;
    }
}
