package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.Collection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CollectionRepository extends JpaRepository<Collection, Long> {

    @Query("select c from Collection c where c.patient.id = ?1 order by c.reward.level asc")
    List<Collection> findByPatientId(Long id);

    @Query("select c from Collection c where c.reward.id = ?1 and c.patient.id = ?2")
    Collection findByRewardId(Long rewardId, Long patientId);

}
