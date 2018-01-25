package com.finalproject.walktogetherapi.service.master;

import com.finalproject.walktogetherapi.entities.master.District;
import com.finalproject.walktogetherapi.entities.master.Province;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DistrictServices {
    List<District> findAll();

    District findById(Long id);

    District findByCode(String code);

    List<District> findByProvinceId(Long provinceId);

    District create(District district);

    District update(Long id, District district);

    District delete(Long id);

}
