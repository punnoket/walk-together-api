package com.finalproject.walktogetherapi.entities;

import javax.persistence.*;

@Entity
@Table(name = "Reward")
public class Reward {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String mapId;
    private String rewardName;
    private String level;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMapId() {
        return mapId;
    }

    public void setMapId(String mapId) {
        this.mapId = mapId;
    }

    public String getRewardName() {
        return rewardName;
    }

    public void setRewardName(String rewardName) {
        this.rewardName = rewardName;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
