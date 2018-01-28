package com.finalproject.walktogetherapi.mapping;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.entities.Matching;
import com.finalproject.walktogetherapi.entities.Patient;

import java.util.ArrayList;
import java.util.List;

public class MatchingMapping {

    private static MatchingMapping instance;

    public static MatchingMapping getInstance() {
        if (instance == null) {
            instance = new MatchingMapping();
        }
        return instance;
    }

    public Matching acceptMatching(Caretaker caretaker,
                                   Patient patient) {

        Matching matching = new Matching();
        matching.setPatient(patient);
        matching.setCaretaker(caretaker);
        return matching;
    }

    public List<Patient> getPatientList(List<Matching> matchingList) {
        List<Patient> patientList = new ArrayList<>();
        for (Matching matching : matchingList) {
            patientList.add(matching.getPatient());
        }
        return patientList;
    }

    public List<Caretaker> getCaretakerList(List<Matching> matchingList) {
        List<Caretaker> caretakerList = new ArrayList<>();
        for (Matching matching : matchingList) {
            caretakerList.add(matching.getCaretaker());
        }
        return caretakerList;
    }

}
