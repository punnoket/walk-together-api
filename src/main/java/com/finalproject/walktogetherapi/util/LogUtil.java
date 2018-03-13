package com.finalproject.walktogetherapi.util;

import com.finalproject.walktogetherapi.entities.Log;
import com.finalproject.walktogetherapi.service.LogService;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

public class LogUtil {

    private static LogUtil instance;

    public static LogUtil getInstance() {
        if (instance == null) {
            instance = new LogUtil();
        }
        return instance;
    }

    public void saveLog(HttpServletRequest httpServletRequest, HashMap<String, Object> request, LogService logService) {
        JSONObject jsonObject = new JSONObject(request);
        Log log = new Log();
        log.setDate(DateTimeManager.getInstance().getCurrentTime());
        log.setDateCreate(DateTimeManager.getInstance().logDateFormat(DateTimeManager.getInstance().getCurrentTime()));
        log.setData(jsonObject.toJSONString());
        log.setUrl(httpServletRequest.getRequestURL().toString());
        log.setMethod(httpServletRequest.getMethod());
        log.setChanel(httpServletRequest.getHeader("user-agent"));
        logService.create(log);
    }

    public void responseFormAPI(HttpServletRequest httpServletRequest, HashMap<String, Object> request, LogService logService) {
        JSONObject jsonObject = new JSONObject(request);
        Log log = new Log();
        log.setDate(DateTimeManager.getInstance().getCurrentTime());
        log.setDateCreate(DateTimeManager.getInstance().logDateFormat(DateTimeManager.getInstance().getCurrentTime()));
        log.setData(jsonObject.toJSONString());
        log.setUrl(httpServletRequest.getRequestURL().toString());
        log.setMethod("RESPONSE API");
        log.setChanel(httpServletRequest.getHeader("user-agent"));
        logService.create(log);
    }

    public void saveLog(HttpServletRequest httpServletRequest, String request, LogService logService) {
        Log log = new Log();
        log.setDate(DateTimeManager.getInstance().getCurrentTime());
        log.setDateCreate(DateTimeManager.getInstance().logDateFormat(DateTimeManager.getInstance().getCurrentTime()));
        log.setData(request);
        log.setUrl(httpServletRequest.getRequestURL().toString());
        log.setMethod(httpServletRequest.getMethod());
        log.setChanel(httpServletRequest.getHeader("user-agent"));
        logService.create(log);
    }

    public void saveLogJson(HttpServletRequest httpServletRequest, JSONObject request, LogService logService) {
        Log log = new Log();
        log.setDate(DateTimeManager.getInstance().getCurrentTime());
        log.setDateCreate(DateTimeManager.getInstance().logDateFormat(DateTimeManager.getInstance().getCurrentTime()));
        log.setData(request.toJSONString());
        log.setUrl(httpServletRequest.getRequestURL().toString());
        log.setMethod(httpServletRequest.getMethod());
        log.setChanel(httpServletRequest.getHeader("user-agent"));
        logService.create(log);
    }

}

