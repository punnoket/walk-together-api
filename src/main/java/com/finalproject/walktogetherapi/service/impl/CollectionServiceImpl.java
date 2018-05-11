package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.Collection;
import com.finalproject.walktogetherapi.repository.CollectionRepository;
import com.finalproject.walktogetherapi.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollectionServiceImpl implements CollectionService {
    private CollectionRepository collectionRepository;

    @Autowired
    public CollectionServiceImpl(CollectionRepository collectionRepository) {
        this.collectionRepository = collectionRepository;
    }

    @Override
    public List<Collection> findAll() {
        return collectionRepository.findAll();
    }

    @Override
    public Collection findById(Long id) {
        return collectionRepository.findOne(id);
    }

    @Override
    public Collection create(Collection collection) {
        return collectionRepository.saveAndFlush(collection);
    }

    @Override
    public Collection update(Long id, Collection collection) {
        return collectionRepository.saveAndFlush(collection);
    }

    @Override
    public Collection delete(Long id) {
        Collection result = collectionRepository.findOne(id);
        collectionRepository.delete(id);
        return result;
    }

    @Override
    public List<Collection> findByPatientId(Long id) {
        return collectionRepository.findByPatientId(id);
    }

    @Override
    public Collection findByRewardId(Long rewardId, Long patientId) {
        return collectionRepository.findByRewardId(rewardId, patientId);
    }

    @Override
    public List<Collection> findByRangeLevel( Long id, int beginLevel, int endLevel) {
        return collectionRepository.findByRangeLevel(id, beginLevel, endLevel);
    }
}
