package com.finalproject.walktogetherapi.entities;
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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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
        reward = reward;
    }
}
