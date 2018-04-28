package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.Collection;
import com.finalproject.walktogetherapi.entities.Matching;
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

    List<Collection> findByRewardId(Long id);



}