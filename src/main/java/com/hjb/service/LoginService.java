package com.hjb.service;

import com.hjb.daomain.Admin;
import com.hjb.daomain.Refile;
import com.hjb.daomain.Student;
import com.hjb.daomain.Teacher;

import java.util.List;

public interface LoginService {
    public String Addstudent(Student student);
    public Student FindstudentbyId(String studentid);
    public String LoginCheck(String studentid,String password,String role);
    public Teacher FindTeacherbyid(String teacherid);
    public Admin FindAdminbyid(String id);
    public List<Refile>findrefileall(int page,int size);
}
