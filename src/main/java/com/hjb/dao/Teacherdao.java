package com.hjb.dao;

import com.hjb.daomain.Teacher;

import java.util.List;
import java.util.Map;

public interface Teacherdao {
    public Teacher FindTeacherbyid(String id);
    public int Addteacher(Teacher teacher);
    public List<Teacher> Findteacherall();
    public int Updateteacherpd(Map hashmap);
    public int Deleteteacher(String id);
    public int Addteachers(List<Teacher> teacherList);
    public int Updateteacher(Teacher teacher);
}
