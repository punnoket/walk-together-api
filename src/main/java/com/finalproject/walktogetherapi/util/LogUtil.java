package com.finalproject.walktogetherapi.util;

import com.finalproject.walktogetherapi.entities.Log;
import com.finalproject.walktogetherapi.service.LogService;

import javax.servlet.http.HttpServletRequest;

public class LogUtil {

    private static LogUtil instance;

    public static LogUtil getInstance() {
        if (instance == null) {
            instance = new LogUtil();
        }
        return instance;
    }

    public void saveLog(HttpServletRequest httpServletRequest, String request, LogService logService) {
        Log log = new Log();
        log.setDate(DateTimeManager.getInstance().getCurrentTime());
        log.setData(request);
        log.setUrl(httpServletRequest.getRequestURL().toString());
        log.setMethod(httpServletRequest.getMethod());
        log.setChanel(httpServletRequest.getHeader("user-agent"));
        logService.create(log);
    }
}

