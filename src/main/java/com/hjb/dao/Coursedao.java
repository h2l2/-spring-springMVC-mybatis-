package com.hjb.dao;

import com.hjb.daomain.Course;

import java.util.List;

public interface Coursedao {
    public int Addcourse(Course course);
    public Course Findcoursebyid(String id);
    public List<Course> Findcourseall();
    public int Deletecourse(String id);
    public int Updatecourse(Course course);
    public List<Course> Findallcourseandt(String sid);
    public List<Course> Findallcoursebycid(List<String> list);
    public List<Course> Findteacherallcourse(String tid);
    public String Findteacheridbycid(String cid);
    public List<String> Findcoursebyname(String name);
    public List<Course> Findcourseallbyname(String name);
}
