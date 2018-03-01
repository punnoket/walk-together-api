package com.finalproject.walktogetherapi.repository.mission;

import com.finalproject.walktogetherapi.entities.mission.Map;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MapRepository extends JpaRepository<Map, Long> {
}
