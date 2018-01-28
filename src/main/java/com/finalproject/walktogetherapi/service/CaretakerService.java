package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.entities.Patient;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CaretakerService {

    List<Caretaker> findAll();

    Caretaker findById(Long id);

    Caretaker create(Caretaker caretaker);

    Caretaker update(Long id, Caretaker caretaker);

    Caretaker delete(Long id);

    Caretaker findByUserName(String userName);

    Caretaker findByEmail(String email);

    Caretaker findByTell(String tell);

}
