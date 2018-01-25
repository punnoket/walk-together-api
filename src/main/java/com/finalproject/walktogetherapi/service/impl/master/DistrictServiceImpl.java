package com.finalproject.walktogetherapi.service.impl.master;

import com.finalproject.walktogetherapi.entities.master.District;
import com.finalproject.walktogetherapi.repository.master.DistrictRepository;
import com.finalproject.walktogetherapi.service.master.DistrictServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;

@Service
public class DistrictServiceImpl implements DistrictServices {

    private DistrictRepository districtsRepository;

    @Autowired
    public DistrictServiceImpl(DistrictRepository districtsRepository) {
        this.districtsRepository = districtsRepository;
    }

    @Override
    public List<District> findAll() {
        return districtsRepository.findAll();
    }

    @Override
    public District findById(Long id) {
        return districtsRepository.findOne(id);
    }

    @Override
    public List<District> findByProvinceId(Long provincesId) {
        List<District> result = districtsRepository.findByProvincesId(provincesId);
        result.sort(Comparator.comparing(District::getName));
        return result;
    }

    @Override
    public District findByCode(String code) {
        return districtsRepository.findByCode(code);
    }

    @Override
    public District create(District districts) {
        return districtsRepository.saveAndFlush(districts);
    }

    @Override
    public District update(Long id, District districts) {
        District result = districtsRepository.findOne(id);
        if (districts.getCode() != null) {
            result.setCode(districts.getCode());
        }
        if (districts.getName() != null) {
            result.setName(districts.getName());
        }
        return districtsRepository.saveAndFlush(result);
    }

    @Override
    public District delete(Long id) {
        District districts = districtsRepository.findOne(id);
        districtsRepository.delete(districts);
        return districts;
    }
}
