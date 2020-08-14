package com.hjb.daomain;

import java.util.Date;

public class Announceme {
    private int id;
    private String name;
    private Date statime;
    private String content;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStatime() {
        return statime;
    }

    public void setStatime(Date statime) {
        this.statime = statime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
