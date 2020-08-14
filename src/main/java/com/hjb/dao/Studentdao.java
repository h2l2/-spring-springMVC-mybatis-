package com.hjb.dao;

import com.hjb.daomain.Student;

import java.util.List;
import java.util.Map;

public interface Studentdao {
    public int Addstudent(Student student);
    public Student FindstudentbyId(String id);
    public List<Student> Findstudentall();
    public int Updatestudentpd(Map hashmap);
    public int Deletestudent(String id);
    public List<Student> Findstudentbycid(String cid);
    public List<Student> Findstudentbyttid(String ttid);
    public int Updatestudent(Student student);
}
