package com.finalproject.walktogetherapi.service.master;

import com.finalproject.walktogetherapi.entities.master.Province;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProvinceServices {
    List<Province> findAll();

    Province findById(Long id);

    Province findByCode(String code);

    Province create(Province provinces);

    Province update(Long id, Province provinces);

    Province delete(Long id);

}
