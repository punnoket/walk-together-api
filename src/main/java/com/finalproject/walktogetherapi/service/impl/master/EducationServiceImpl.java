package com.finalproject.walktogetherapi.service.impl.master;

import com.finalproject.walktogetherapi.entities.master.Education;
import com.finalproject.walktogetherapi.entities.master.Sex;
import com.finalproject.walktogetherapi.repository.master.EducationRepository;
import com.finalproject.walktogetherapi.repository.master.SexRepository;
import com.finalproject.walktogetherapi.service.master.EducationServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EducationServiceImpl implements EducationServices {
    private EducationRepository educationRepository;

    @Autowired
    public EducationServiceImpl(EducationRepository educationRepository) {
        this.educationRepository = educationRepository;
    }

    @Override
    public List<Education> findAll() {
        return educationRepository.findAll();
    }

    @Override
    public Education findById(Long id) {
        return educationRepository.findOne(id);
    }

    @Override
    public Education create(Education education) {
        return educationRepository.saveAndFlush(education);
    }

    @Override
    public Education update(Long id, Education education) {
        return educationRepository.saveAndFlush(education);
    }

    @Override
    public Education delete(Long id) {
        Education education = educationRepository.findOne(id);
        educationRepository.delete(education);
        return education;
    }
}
