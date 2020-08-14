package com.hjb.daomain;

public class Teacher {
    private String id;
    private String name;
    private String password;
    private String phonnumber;
    private String facultyde;
    private String title;
    private Course course;

    public String getFacultyde() {
        return facultyde;
    }

    public void setFacultyde(String facultyde) {
        this.facultyde = facultyde;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhonnumber() {
        return phonnumber;
    }

    public void setPhonnumber(String phonnumber) {
        this.phonnumber = phonnumber;
    }
}
