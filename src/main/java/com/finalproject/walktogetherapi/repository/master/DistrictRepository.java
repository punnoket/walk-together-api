package com.finalproject.walktogetherapi.repository.master;

import com.finalproject.walktogetherapi.entities.master.District;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DistrictRepository extends JpaRepository<District, Long> {

    @Query("SELECT d FROM District d Where d.province.id =?1 order by d.name ASC")
    List<District> findByProvincesId(Long provincesId);

    District findByCode(String code);
}
