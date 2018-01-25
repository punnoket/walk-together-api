package com.finalproject.walktogetherapi.service.impl.master;
import com.finalproject.walktogetherapi.entities.master.Sex;
import com.finalproject.walktogetherapi.repository.master.SexRepository;
import com.finalproject.walktogetherapi.service.master.SexServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SexServiceImpl implements SexServices {
    private SexRepository sexRepository;

    @Autowired
    public SexServiceImpl(SexRepository sexRepository) {
        this.sexRepository = sexRepository;
    }

    @Override
    public List<Sex> findAll() {
        return sexRepository.findAll();
    }

    @Override
    public Sex findById(Long id) {
        return sexRepository.findOne(id);
    }

    @Override
    public Sex findByName(String name) {
        return sexRepository.findByName(name);
    }

    @Override
    public Sex create(Sex sex) {
        return sexRepository.saveAndFlush(sex);
    }

    @Override
    public Sex update(Long id, Sex sex) {
        Sex result = sexRepository.findOne(id);
        if (sex.getCode() != null) {
            result.setCode(sex.getCode());
        }
        if (sex.getName() != null) {
            result.setName(sex.getName());
        }
        result.setModified(new Date());
        return sexRepository.saveAndFlush(result);
    }

    @Override
    public Sex delete(Long id) {
        Sex sex = sexRepository.findOne(id);
        sexRepository.delete(sex);
        return sex;
    }
}
