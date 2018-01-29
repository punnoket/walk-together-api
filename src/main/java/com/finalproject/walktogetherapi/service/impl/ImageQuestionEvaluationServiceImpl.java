package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.evaluation.EvaluationCategory;
import com.finalproject.walktogetherapi.entities.evaluation.ImageQuestionEvaluation;
import com.finalproject.walktogetherapi.repository.EvaluationCategoryRepository;
import com.finalproject.walktogetherapi.repository.ImageQuestionEvaluationRepository;
import com.finalproject.walktogetherapi.service.ImageQuestionEvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageQuestionEvaluationServiceImpl implements ImageQuestionEvaluationService {
    private ImageQuestionEvaluationRepository imageQuestionEvaluationRepository;

    @Autowired
    public ImageQuestionEvaluationServiceImpl(ImageQuestionEvaluationRepository imageQuestionEvaluationRepository) {
        this.imageQuestionEvaluationRepository = imageQuestionEvaluationRepository;
    }


    @Override
    public List<ImageQuestionEvaluation> findAll() {
        return this.imageQuestionEvaluationRepository.findAll();
    }

    @Override
    public  ImageQuestionEvaluation findById(Long id) {
        return imageQuestionEvaluationRepository.findOne(id);
    }

    @Override
    public  ImageQuestionEvaluation create( ImageQuestionEvaluation evaluationCategory) {
        return imageQuestionEvaluationRepository.saveAndFlush(evaluationCategory);
    }

    @Override
    public  ImageQuestionEvaluation update(Long id,  ImageQuestionEvaluation imageQuestionEvaluation) {
        return null;
    }

    @Override
    public ImageQuestionEvaluation delete(Long id) {
        ImageQuestionEvaluation result = imageQuestionEvaluationRepository.findOne(id);
        imageQuestionEvaluationRepository.delete(id);
        return result;
    }

}
