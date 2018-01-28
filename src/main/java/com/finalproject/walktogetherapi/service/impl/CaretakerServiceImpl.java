package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.repository.CaretakerRepository;
import com.finalproject.walktogetherapi.repository.PatientRepository;
import com.finalproject.walktogetherapi.service.CaretakerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CaretakerServiceImpl implements CaretakerService {
    private CaretakerRepository caretakerRepository;

    @Autowired
    public CaretakerServiceImpl(CaretakerRepository caretakerRepository) {
        this.caretakerRepository = caretakerRepository;
    }

    @Override
    public List<Caretaker> findAll() {
        return this.caretakerRepository.findAll();
    }

    @Override
    public Caretaker findById(Long id) {
        return caretakerRepository.findOne(id);
    }

    @Override
    public Caretaker create(Caretaker caretaker) {
        return caretakerRepository.saveAndFlush(caretaker);
    }

    @Override
    public Caretaker update(Long id, Caretaker caretaker) {
        return caretakerRepository.saveAndFlush(caretaker);
    }

    @Override
    public Caretaker delete(Long id) {
        Caretaker result = caretakerRepository.findOne(id);
        caretakerRepository.delete(id);
        return result;
    }

    @Override
    public Caretaker findByUserName(String userName) {
        return caretakerRepository.findByUserName(userName);
    }

    @Override
    public Caretaker findByEmail(String email) {
        return caretakerRepository.findByEmail(email);
    }

    @Override
    public Caretaker findByTell(String tell) {
        return caretakerRepository.findByTell(tell);
    }

    @Override
    public Caretaker findByNumberCaretaker(String number) {
        return caretakerRepository.findByNumberCaretaker(number);
    }

}
