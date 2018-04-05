package com.finalproject.walktogetherapi.service.mission;
import com.finalproject.walktogetherapi.entities.mission.AnswerMission;
import com.finalproject.walktogetherapi.entities.mission.Mission;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AnswerMissionService {

    List<AnswerMission> findAll();

    AnswerMission findById(Long id);

    AnswerMission create(AnswerMission data);

    AnswerMission update(Long id, AnswerMission data);

    AnswerMission delete(Long id);
}
