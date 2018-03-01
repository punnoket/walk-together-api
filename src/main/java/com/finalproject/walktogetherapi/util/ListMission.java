package com.finalproject.walktogetherapi.util;

import java.util.ArrayList;

public class ListMission extends ArrayList<Object> {
    @Override
    public boolean add(Object o) {
        return this.size() < Constant.SIZE_MISSION && super.add(o);
    }
}
