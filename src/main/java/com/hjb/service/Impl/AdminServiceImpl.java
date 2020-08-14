package com.hjb.service.Impl;

import com.github.pagehelper.PageHelper;
import com.hjb.dao.*;
import com.hjb.daomain.*;
import com.hjb.service.AdminService;
import com.hjb.utils.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.lang.reflect.Array;
import java.util.*;

@Service
public class AdminServiceImpl implements AdminService {
    private Teacherdao teacherdao;
    private Studentdao studentdao;
    private Admindao admindao;
    private Coursedao coursedao;
    private Announcemedao announcemedao;
    private Refiledao refiledao;
    private SCdao sCdao;

    public SCdao getsCdao() {
        return sCdao;
    }
    @Autowired
    public void setsCdao(SCdao sCdao) {
        this.sCdao = sCdao;
    }

    public Refiledao getRefiledao() {
        return refiledao;
    }
    @Autowired
    public void setRefiledao(Refiledao refiledao) {
        this.refiledao = refiledao;
    }

    public Announcemedao getAnnouncemedao() {
        return announcemedao;
    }
    @Autowired
    public void setAnnouncemedao(Announcemedao announcemedao) {
        this.announcemedao = announcemedao;
    }

    public Coursedao getCoursedao() {
        return coursedao;
    }
    @Autowired
    public void setCoursedao(Coursedao coursedao) {
        this.coursedao = coursedao;
    }

    public Admindao getAdmindao() {
        return admindao;
    }
    @Autowired
    public void setAdmindao(Admindao admindao) {
        this.admindao = admindao;
    }

    public Studentdao getStudentdao() {
        return studentdao;
    }
    @Autowired
    public void setStudentdao(Studentdao studentdao) {
        this.studentdao = studentdao;
    }

    public Teacherdao getTeacherdao() {
        return teacherdao;
    }
    @Autowired
    public void setTeacherdao(Teacherdao teacherdao) {
        this.teacherdao = teacherdao;
    }

    @Override
    public String Addteacher(Teacher teacher) {
        Teacher teacher1 = new Teacher();
        if (teacher.getId()!=null){
            teacher1 = teacherdao.FindTeacherbyid(teacher.getId());
        }
        if(teacher1!=null){
            return "该用户ID已存在！";
        }else{
            int num = teacherdao.Addteacher(teacher);
            if(num>0){
                return "添加成功";
            }else{
                return "添加失败，请重新填写信息！";
            }
        }
    }

    @Override
    public List<Teacher> Findteacherall(int page,int size) {
        PageHelper.startPage(page,size);
        return teacherdao.Findteacherall();
    }

    @Override
    public List<Student> Findstudentall(int page, int size) {
        PageHelper.startPage(page,size);
        return studentdao.Findstudentall();
    }

    @Override
    public String Updatestudentpd(String id,String password,String role) {
        Map<String,String> paramsMap = new HashMap<String, String>();
        paramsMap.put("id",id);
        paramsMap.put("password",password);
        if(admindao.FindAdminbyid(id)==null){
            if ("teacher".equals(role)){
                if (teacherdao.FindTeacherbyid(id)!=null){
                    int n = teacherdao.Updateteacherpd(paramsMap);
                    if (n>0){
                        return "修改成功！";
                    }else {
                        return "修改失败！";
                    }
                }else {
                    return "此账号不存在";
                }
            }else {
                if (studentdao.FindstudentbyId(id)!=null){
                     int num = studentdao.Updatestudentpd(paramsMap);
                     if (num>0){
                         return "修改成功！";
                     }else {
                         return "修改失败！";
                     }
                }else {
                    return "此账号不存在";
                }
            }
        }else {
            return "此账户为管理员账号";
        }
    }

    @Override
    public String Addcourse(Course course) {
        Course course1 = new Course();
        if (course.getId()!=null){
            course1 = coursedao.Findcoursebyid(course.getId());
        }
        if(course1!=null&&course1.getBatch()==course.getBatch()){
            return "该课程批次已存在！";
        }else{
            int num = coursedao.Addcourse(course);
            if(num>0){
                return "添加成功";
            }else{
                return "添加失败，请重新填写信息！";
            }
        }
    }
    @Override
    public List<Course> Findcourseall(int page,int size){
        PageHelper.startPage(page,size);
        return coursedao.Findcourseall();
    }

    @Override
    public String Deletecourse(String id) {
        int num = coursedao.Deletecourse(id);
        if(num>0){
            return "/admin/showCourse";
        }else {
            return "error";
        }
    }

    @Override
    public String Deletestudent(String id) {
        int num = studentdao.Deletestudent(id);
        if(num>0){
            return "/admin/showStudent";
        }else {
            return "error";
        }
    }

    @Override
    public String Deleteteacher(String id) {
        int num = teacherdao.Deleteteacher(id);
        if(num>0){
            return "/admin/showTeacher";
        }else {
            return "error";
        }
    }

    @Override
    public String Updatecourse(Course course) {
        int num = coursedao.Updatecourse(course);
        if (num>0){
            return "修改成功！";
        }else {
            return "修改失败！";
        }
    }

    @Override
    public Course Findcoursebyid(String id) {
        return coursedao.Findcoursebyid(id);
    }

    @Override
    public String Addannounceme(Announceme announceme) {
        Date date = new Date();
        announceme.setStatime(date);
        int num = announcemedao.addannounceme(announceme);
        if(num>0){
            return "添加成功！";
        }else {
            return "添加失败！";
        }
    }

    @Override
    public List<Announceme> findannouncemeall(int page,int size) {
        PageHelper.startPage(page,size);
        return announcemedao.findannouncemeall();
    }

    @Override
    public String deleteannouncemebyid(Announceme announceme) {
        int num = announcemedao.deleteannounceme(announceme);
        if(num>0){
            return "删除成功，请刷新页面";
        }else {
            return "删除失败！";
        }
    }

    @Override
    public Announceme findfindannouncemebyid(int id) {
        return announcemedao.findfindannouncemebyid(id);
    }

    @Override
    public String updateannounceme(Announceme announceme) {
        int num = announcemedao.updateannounceme(announceme);

        if(num>0){
            return "更新成功，请刷新页面";
        }else {
            return "更新失败！";
        }
    }

    @Override
    public List<Refile> findrefileall(int page,int size) {
        PageHelper.startPage(page,size);
        return refiledao.findrefileall();
    }

    @Override
    public String updaterefilestatus(Refile refile) {
        int num = refiledao.updaterefilestatus(refile);
        if(num>0){
            return "操作成功，请刷新页面！";
        }else {
            return "操作失败！";
        }
    }

    @Override
    public String importExcelInfo(InputStream in, MultipartFile file)throws Exception {
        System.out.println(file.getOriginalFilename());
        List<List<Object>> listob = ExcelUtil.getBankListByExcel(in,file.getOriginalFilename());
        System.out.println("到这！");
        List<Teacher> teacherList = new ArrayList<Teacher>();
        //遍历listob数据，把数据放到List中
        for (int i = 0; i < listob.size(); i++) {
            List<Object> ob = listob.get(i);
            Teacher teacher = new Teacher();
            //通过遍历实现把每一列封装成一个model中，再把所有的model用List集合装载
            teacher.setId(String.valueOf(ob.get(0)));
            teacher.setName(String.valueOf(ob.get(1)));
            teacher.setPassword(String.valueOf(ob.get(2)));
            teacher.setPhonnumber(String.valueOf(ob.get(3)));
            teacherList.add(teacher);
        }
        //批量插入
        int num = teacherdao.Addteachers(teacherList);
        if(num>0){
            return "导入成功！";
        }else {
            return "导入失败！";
        }
    }

    @Override
    public Map<String, Object> fromefind() {
        int count=0;
        List<Object> list3 = new ArrayList<>();
       List<String> list = coursedao.Findcoursebyname("计算机网络实验");
       List<Course> list2 = coursedao.Findcourseallbyname("计算机网络实验");
       List<SC> list1= sCdao.countstudent("计算机网络实验");
       for(Course c:list2){
           for(SC s: list1){
               if(c.getId().equals(s.getCid())){
                   count++;
               }
           }
           list3.add(count);
           count=0;
       }
       Map<String,Object> map = new HashMap<>();
       map.put("list",list);
       map.put("list1",list3);
       return map;
    }

    @Override
    public Map<String, Object> Cfromefind() {
        int count=0;
        List<Object> Clist3 = new ArrayList<>();
        List<String> Clist = coursedao.Findcoursebyname("C语言实验");
        List<Course> list2 = coursedao.Findcourseallbyname("C语言实验");
        List<SC> list1= sCdao.countstudent("C语言实验");
        for(Course c:list2){
            for(SC s: list1){
                if(c.getId().equals(s.getCid())){
                    count++;
                }
            }
            Clist3.add(count);
            count=0;
        }
        Map<String,Object> map = new HashMap<>();
        map.put("Clist",Clist);
        map.put("Clist1",Clist3);
        return map;
    }

    @Override
    public Map<String, Object> Cjiafromefind() {
        int count=0;
        List<Object> Cjialist3 = new ArrayList<>();
        List<String> Cjialist = coursedao.Findcoursebyname("C++实验");
        List<Course> list2 = coursedao.Findcourseallbyname("C++实验");
        List<SC> list1= sCdao.countstudent("C++实验");
        for(Course c:list2){
            for(SC s: list1){
                if(c.getId().equals(s.getCid())){
                    count++;
                }
            }
            Cjialist3.add(count);
            count=0;
        }
        System.out.println(Cjialist.size());
        Map<String,Object> map = new HashMap<>();
        map.put("Cjialist",Cjialist);
        map.put("Cjialist1",Cjialist3);
        return map;
    }

    @Override
    public Map<String, Object> Afromefind() {
        int count=0;
        List<Object> Alist3 = new ArrayList<>();
        List<String> Alist = coursedao.Findcoursebyname("Android实验");
        List<Course> list2 = coursedao.Findcourseallbyname("Android实验");
        List<SC> list1= sCdao.countstudent("Android实验");
        for(Course c:list2){
            for(SC s: list1){
                if(c.getId().equals(s.getCid())){
                    count++;
                }
            }
            Alist3.add(count);
            count=0;
        }
        Map<String,Object> map = new HashMap<>();
        map.put("Alist",Alist);
        map.put("Alist1",Alist3);
        return map;
    }
}
