package com.finalproject.walktogetherapi.entities;

import com.finalproject.walktogetherapi.util.DateTimeManager;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "log")
public class Log {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String data;
    private String method;
    private String url;
    private String dateCreate;
    private Date date;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDateCreate() {
        return DateTimeManager.getInstance().fullDateFormat(getDate());
    }

    public void setDateCreate(String dateCreate) {
        dateCreate = DateTimeManager.getInstance().fullDateFormat(getDate());
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }
}
