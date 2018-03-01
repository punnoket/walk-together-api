package com.finalproject.walktogetherapi.repository.mission;

import com.finalproject.walktogetherapi.entities.mission.CognitiveCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CognitiveCategoryRepository extends JpaRepository<CognitiveCategory, Long> {
}
