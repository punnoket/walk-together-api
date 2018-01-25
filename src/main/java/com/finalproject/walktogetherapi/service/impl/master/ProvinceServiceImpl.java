package com.finalproject.walktogetherapi.service.impl.master;

import com.finalproject.walktogetherapi.entities.master.Province;
import com.finalproject.walktogetherapi.repository.master.ProvinceRepository;
import com.finalproject.walktogetherapi.service.master.ProvinceServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;

@Service
public class ProvinceServiceImpl implements ProvinceServices {
    private ProvinceRepository provincesRepository;

    @Autowired
    public ProvinceServiceImpl(ProvinceRepository provincesRepository) {
        this.provincesRepository = provincesRepository;
    }

    @Override
    public List<Province> findAll() {
        List<Province> result = provincesRepository.findAllByOrderByNameAsc();
        result.sort(Comparator.comparing(Province::getName));
        return result;
    }

    @Override
    public Province findById(Long id) {
        return provincesRepository.findOne(id);
    }

    @Override
    public Province findByCode(String code) {
        return provincesRepository.findByCode(code);
    }

    @Override
    public Province create(Province provinces) {
        return provincesRepository.saveAndFlush(provinces);
    }

    @Override
    public Province update(Long id, Province provinces) {
        Province result = provincesRepository.findOne(id);
        if (provinces.getCode() != null) {
            result.setCode(provinces.getCode());
        }
        if (provinces.getName() != null) {
            result.setName(provinces.getName());
        }
        return provincesRepository.saveAndFlush(result);
    }

    @Override
    public Province delete(Long id) {
        Province provinces = provincesRepository.findOne(id);
        provincesRepository.delete(provinces);
        return provinces;
    }
}
