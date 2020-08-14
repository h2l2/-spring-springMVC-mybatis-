package com.hjb.service;

import com.hjb.daomain.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface StudentService {
    public String UpStudentpd(String id,String password,String pd);
    public List<Course> Findallcourseandt(int page,int size,String sid);
    public int Addseletecourse(SC sc);
    public List<Course> Findallcoursebycid(String sid,int page,int size);
    public String deletescbysid(SC sc);
    public List<String> Findscbysid(String sid);
    public List<Test> Findtestandt(int page,int size,String sid);
    public String Addreport(Report report);
    public List<SC> Findgradeandc(String sid);
    public String addrefiles(String sid, HttpServletRequest request, String about, List<MultipartFile> file)throws Exception;
    public List<Refile> findrefilebysid(String sid);
    public String updatestudent(Student student);
}
