package com.finalproject.walktogetherapi.service.impl.master;

import com.finalproject.walktogetherapi.entities.master.SubDistrict;
import com.finalproject.walktogetherapi.repository.master.SubDistrictRepository;
import com.finalproject.walktogetherapi.service.master.SubDistrictServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubDistrictsServiceImpl implements SubDistrictServices {

    private SubDistrictRepository subDistrictsRepository;

    @Autowired
    public SubDistrictsServiceImpl(SubDistrictRepository subDistrictsRepository) {
        this.subDistrictsRepository = subDistrictsRepository;
    }

    @Override
    public List<SubDistrict> findAll() {
        return subDistrictsRepository.findAll();
    }

    @Override
    public SubDistrict findById(Long id) {
        return subDistrictsRepository.findOne(id);
    }

    @Override
    public SubDistrict findByCode(String code) {
        return subDistrictsRepository.findByCode(code);
    }

    @Override
    public List<SubDistrict> findByDistrictId(Long districtId) {
        return subDistrictsRepository.findByDistrictId(districtId);
    }

    @Override
    public SubDistrict create(SubDistrict subDistricts) {
        return subDistrictsRepository.saveAndFlush(subDistricts);
    }

    @Override
    public SubDistrict update(Long id, SubDistrict subDistricts) {
        SubDistrict result = subDistrictsRepository.findOne(id);
        if (subDistricts.getCode() != null) {
            result.setCode(subDistricts.getCode());
        }
        if (subDistricts.getName() != null) {
            result.setName(subDistricts.getName());
        }
        return subDistrictsRepository.saveAndFlush(result);
    }

    @Override
    public SubDistrict delete(Long id) {
        SubDistrict subDistricts = subDistrictsRepository.findOne(id);
        subDistrictsRepository.delete(subDistricts);
        return subDistricts;
    }
}
