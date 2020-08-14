package com.hjb.service;

import com.hjb.daomain.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

public interface AdminService {
    public String Addteacher(Teacher teacher);
    public List<Teacher> Findteacherall(int page,int size);
    public List<Student> Findstudentall(int page,int size);
    public String Updatestudentpd(String id,String password,String role);
    public String Addcourse(Course course);
    public List<Course> Findcourseall(int page,int size);
    public String Deletecourse(String id);
    public String Deletestudent(String id);
    public String Deleteteacher(String id);
    public String Updatecourse(Course course);
    public Course Findcoursebyid(String id);
    public String Addannounceme(Announceme announceme);
    public List<Announceme> findannouncemeall(int page,int size);
    public String deleteannouncemebyid(Announceme announceme);
    public Announceme findfindannouncemebyid(int id);
    public String updateannounceme(Announceme announceme);
    public List<Refile> findrefileall(int psge,int size);
    public String updaterefilestatus(Refile refile);
    public String importExcelInfo(InputStream in, MultipartFile file)throws Exception;
    public Map<String,Object> fromefind();
    public Map<String,Object> Cfromefind();
    public Map<String,Object> Cjiafromefind();
    public Map<String,Object> Afromefind();
}
