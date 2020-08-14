package com.hjb.service.Impl;

import com.github.pagehelper.PageHelper;
import com.hjb.dao.Admindao;
import com.hjb.dao.Refiledao;
import com.hjb.dao.Studentdao;
import com.hjb.dao.Teacherdao;
import com.hjb.daomain.*;
import com.hjb.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {
    private Studentdao studentdao;
    private Teacherdao teacherdao;
    private Admindao admindao;
    private Refiledao refiledao;

    public Refiledao getRefiledao() {
        return refiledao;
    }
    @Autowired
    public void setRefiledao(Refiledao refiledao) {
        this.refiledao = refiledao;
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

    public Admindao getAdmindao() {
        return admindao;
    }
    @Autowired
    public void setAdmindao(Admindao admindao) {
        this.admindao = admindao;
    }

    @Override
    public String Addstudent(Student student){
        String str="register";
        int num = studentdao.Addstudent(student);
        if(num>0){
            return "login";
        }
        return str;
    }

    @Override
    public Student FindstudentbyId(String studentid) {
        Student student = studentdao.FindstudentbyId(studentid);
        return student;
    }

    @Override
    public String LoginCheck(String id, String password,String role) {
        String str="login";
        if("admin".equals(role)){                       //管理员
            Admin admin = admindao.FindAdminbyid(id);
            if(admin!=null){
                if(admin.getPassword().equals(password)){
                    return "/admin/Admin";
                }else {
                    return "error";
                }
            }else{
                return str;
            }
        }else if("teacher".equals(role)){                //老师
            Teacher teacher = teacherdao.FindTeacherbyid(id);
            if(teacher!=null){
                if(teacher.getPassword().equals(password)){
                    return "/teacher/Teacher";
                }else {
                    return "error";
                }
            }else{
                return str;
            }
        }else {                                            //学生
            Student student = studentdao.FindstudentbyId(id);
            if(student!=null){
                if(student.getPassword().equals(password)){
                    return "/student/Student";
                }else {
                    return "error";
                }
            }else{
                return str;
            }
        }

    }

    @Override
    public Teacher FindTeacherbyid(String id) {
        Teacher teacher = teacherdao.FindTeacherbyid(id);
        return teacher;
    }

    @Override
    public Admin FindAdminbyid(String id) {
        Admin admin = admindao.FindAdminbyid(id);
        return admin;
    }

    @Override
    public List<Refile> findrefileall(int page,int size) {
        PageHelper.startPage(page,size);
        List<Refile> list = refiledao.findrefileall();
        Iterator<Refile> it = list.iterator();
        while (it.hasNext()){
            Refile refile1 = it.next();
            if (!refile1.getStatus().equals("审核通过")){
                it.remove();
            }
        }
        return list;
    }
}

