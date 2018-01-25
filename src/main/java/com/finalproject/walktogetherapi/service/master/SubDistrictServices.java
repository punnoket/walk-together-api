package com.finalproject.walktogetherapi.service.master;
import com.finalproject.walktogetherapi.entities.master.SubDistrict;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SubDistrictServices {
    List<SubDistrict> findAll();

    SubDistrict findById(Long id);

    SubDistrict findByCode(String code);

    List<SubDistrict> findByDistrictId(Long districtId);

    SubDistrict create(SubDistrict subDistrict);

    SubDistrict update(Long id, SubDistrict subDistrict);

    SubDistrict delete(Long id);

}
