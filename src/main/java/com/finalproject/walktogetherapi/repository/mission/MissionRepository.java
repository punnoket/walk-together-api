package com.finalproject.walktogetherapi.repository.mission;

import com.finalproject.walktogetherapi.entities.mission.Mission;
import org.hibernate.mapping.Map;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MissionRepository extends JpaRepository<Mission, Long> {

    @Query("select m from Mission m where m.type like %?1%")
    List<Mission> findByType(String type);
}
