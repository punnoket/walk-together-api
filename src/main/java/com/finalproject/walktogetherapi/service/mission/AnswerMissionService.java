package com.finalproject.walktogetherapi.service.mission;
import com.finalproject.walktogetherapi.entities.mission.AnswerMission;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AnswerMissionService {

    List<AnswerMission> findAll();

    List<AnswerMission> findByMissionType(String type, String answer);

    AnswerMission findById(Long id);

    AnswerMission create(AnswerMission data);

    AnswerMission update(Long id, AnswerMission data);

    AnswerMission delete(Long id);
}
