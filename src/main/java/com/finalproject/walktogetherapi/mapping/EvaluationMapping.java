package com.finalproject.walktogetherapi.mapping;

import com.finalproject.walktogetherapi.entities.EvaluationCategory;
import com.finalproject.walktogetherapi.entities.NumberEvaluation;
import com.finalproject.walktogetherapi.entities.QuestionEvaluation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

public class EvaluationMapping {

    private static EvaluationMapping instance;

    public static EvaluationMapping getInstance() {
        if (instance == null) {
            instance = new EvaluationMapping();
        }
        return instance;
    }

    public HashMap<String, Object> getEvaluationByIdUser(List<EvaluationCategory> evaluationCategoryList) {
        HashMap<String, Object> data = new HashMap<>();
        for (EvaluationCategory category : evaluationCategoryList) {
            data.put(category.getEvaluationCategoryName().toLowerCase(), getResultQuestion(category.getNumberEvaluations()));
        }
        return data;
    }

    private QuestionEvaluation randomQuestion(List<QuestionEvaluation> questionEvaluations) {
        int random = new Random().nextInt(questionEvaluations.size());
        return questionEvaluations.get(random);
    }

    private List<HashMap<String, Object>> getResultQuestion(List<NumberEvaluation> list) {
        List<HashMap<String, Object>> mapList = new ArrayList<>();
        for (NumberEvaluation numberEvaluation : list) {
            HashMap<String, Object> data = new HashMap<>();
            if (numberEvaluation.getQuestionEvaluations().size() > 0) {
                data.put("no", numberEvaluation.getNo());
                data.put("question", randomQuestion(numberEvaluation.getQuestionEvaluations()));
                mapList.add(data);
            }
        }
        return mapList;
    }

}
