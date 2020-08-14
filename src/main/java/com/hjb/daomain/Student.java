package com.hjb.daomain;

import java.util.List;

public class Student {
    private String id;
    private String name;
    private String professiona;
    private String password;
    private String phonenumber;
    private String dormitory;
    private List<Stt> stts;

    public String getDormitory() {
        return dormitory;
    }
    public void setDormitory(String dormitory) {
        this.dormitory = dormitory;
    }

    public List<Stt> getStts() {
        return stts;
    }

    public void setStts(List<Stt> stts) {
        this.stts = stts;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfessiona() {
        return professiona;
    }

    public void setProfessiona(String professiona) {
        this.professiona = professiona;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }
}
