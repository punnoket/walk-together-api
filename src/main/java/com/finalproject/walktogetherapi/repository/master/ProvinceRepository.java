package com.finalproject.walktogetherapi.repository.master;

import com.finalproject.walktogetherapi.entities.master.Province;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProvinceRepository extends JpaRepository<Province, Long> {

    @Query("SELECT p FROM Province p ORDER BY p.name ASC")
    List<Province> findAllByOrderByNameAsc();

    Province findByCode(String code);
}
