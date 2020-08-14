package com.hjb.service;

import com.hjb.daomain.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.List;

public interface TeacherService {
    public String UpTeacherpd(String id,String password,String pd);
    public List<Course> Findteacherallcourse(String tid,int page,int size);
    public List<Student> Findstudentbycid(String cid,int page,int size);
    public String Addtest(String id, String name, String time,Float percentage, String cid,String tid,
                          HttpServletRequest request, List<MultipartFile> file)throws Exception;
    public List<Test> Findtestallbytid(String tid,int page,int size) throws Exception;
    public List<Student> Findstudentbyttid(String ttid,int page,int size);
    public String deletetest(String id);
    public Test Findtestbyid(String id);
    public String Updatetest(String id, String name, String time,Float percentage, String cid,String tid,
                          HttpServletRequest request, List<MultipartFile> file)throws Exception;
    public List<Report> Findroportbytest(String sid,String ttid);
    public int Updatereportname(Report report);
    public String Updatetegrade(Stt stt);
    public Stt Findgrade(Stt stt);
    public List<Test> Findtestandtt(String cid);
    public String Updategradeall(SC sc);
    public XSSFWorkbook exportExcelInfo(String cid)throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException;
    public List<SC> Findgradeands(String cid);
    public String addrefile(String tid,HttpServletRequest request,String about,List<MultipartFile> file)throws Exception;
    public List<Refile> findrefilebytid(String tid);
    public String deleterefilebyid(Refile refile);
    public String Updateteacher(Teacher teacher);
}
