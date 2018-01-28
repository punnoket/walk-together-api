package com.finalproject.walktogetherapi.entities;

import com.finalproject.walktogetherapi.entities.master.District;
import com.finalproject.walktogetherapi.entities.master.Province;
import com.finalproject.walktogetherapi.entities.master.Sex;
import com.finalproject.walktogetherapi.entities.master.SubDistrict;

import javax.persistence.*;

@Entity
@Table(name = "Matching")
public class Matching {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private Patient patient;
    @ManyToOne
    private Caretaker caretaker;

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

    public Caretaker getCaretaker() {
        return caretaker;
    }

    public void setCaretaker(Caretaker caretaker) {
        this.caretaker = caretaker;
    }
}
