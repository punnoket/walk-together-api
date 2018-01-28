package com.finalproject.walktogetherapi.mapping;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.entities.Matching;
import com.finalproject.walktogetherapi.entities.Patient;

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

}
