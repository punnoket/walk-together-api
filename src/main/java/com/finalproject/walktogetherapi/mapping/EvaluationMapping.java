package com.finalproject.walktogetherapi.mapping;

import com.finalproject.walktogetherapi.entities.evaluation.EvaluationCategory;
import com.finalproject.walktogetherapi.entities.evaluation.NumberEvaluation;
import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;

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

    public List<HashMap<String, Object>> getEvaluation(List<EvaluationCategory> evaluationCategoryList) {
        List<HashMap<String, Object>> mapList = new ArrayList<>();
        for (EvaluationCategory category : evaluationCategoryList) {
            HashMap<String, Object> data = new HashMap<>();
            data.put("category", category.getEvaluationCategoryName().toLowerCase());
            data.put("questions", getResultQuestion(category.getNumberEvaluations()));
            mapList.add(data);
        }
        return mapList;
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
                QuestionEvaluation question = randomQuestion(numberEvaluation.getQuestionEvaluations());
                data.put("question", question);
                data.put("answer", question.getAnswerEvaluations());
                mapList.add(data);
            }
        }
        return mapList;
    }

}
