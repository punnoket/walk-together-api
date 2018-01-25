package com.finalproject.walktogetherapi.repository.master;

import com.finalproject.walktogetherapi.entities.master.Sex;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SexRepository extends JpaRepository<Sex, Long> {

    Sex findByName(String name);
}
