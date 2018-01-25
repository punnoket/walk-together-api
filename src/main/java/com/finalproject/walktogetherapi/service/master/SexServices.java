package com.finalproject.walktogetherapi.service.master;

import com.finalproject.walktogetherapi.entities.master.Sex;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SexServices {
    List<Sex> findAll();

    Sex findById(Long id);

    Sex findByName(String name);

    Sex create(Sex sex);

    Sex update(Long id, Sex sex);

    Sex delete(Long id);
}
