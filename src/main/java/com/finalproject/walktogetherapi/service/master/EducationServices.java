package com.finalproject.walktogetherapi.service.master;

import com.finalproject.walktogetherapi.entities.master.Education;
import com.finalproject.walktogetherapi.entities.master.Sex;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface EducationServices {
    List<Education> findAll();

    Education findById(Long id);

    Education create(Education education);

    Education update(Long id, Education education);

    Education delete(Long id);
}
