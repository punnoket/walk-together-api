package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.Collection;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CollectionService {

    List<Collection> findAll();

    Collection findById(Long id);

    Collection create(Collection collection);

    Collection update(Long id, Collection collection);

    Collection delete(Long id);

    List<Collection> findByPatientId(Long id);

    Collection findByRewardId(Long rewardId, Long patientId);

    List<Collection> findByRangeLevel(Long id, int beginLevel, int endLevel);
}
