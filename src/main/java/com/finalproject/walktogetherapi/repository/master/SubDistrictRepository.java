package com.finalproject.walktogetherapi.repository.master;

import com.finalproject.walktogetherapi.entities.master.SubDistrict;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubDistrictRepository extends JpaRepository<SubDistrict, Long> {

    @Query("SELECT sd FROM SubDistrict sd where sd.district.id =?1 ORDER BY sd.name ASC")
    List<SubDistrict> findByDistrictId(Long districtsId);

    SubDistrict findByCode(String code);
}
