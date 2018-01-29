package com.finalproject.walktogetherapi.entities.evaluation;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "ImageQuestionEvaluation")
public class ImageQuestionEvaluation {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String path;

    public void setId(Long id) {
        this.id = id;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Long getId() {
        return id;
    }

    public String getPath() {
        return path;
    }
}
