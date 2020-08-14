package com.hjb.controller;

import com.github.pagehelper.PageInfo;
import com.hjb.dao.Testdao;
import com.hjb.daomain.*;
import com.hjb.service.AdminService;
import com.hjb.service.LoginService;
import com.hjb.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController {

    private LoginService loginService;
    private Testdao testdao;
    private AdminService adminService;

    public AdminService getAdminService() {
        return adminService;
    }
    @Autowired
    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    public Testdao getTestdao() {
        return testdao;
    }
    @Autowired
    public void setTestdao(Testdao testdao) {
        this.testdao = testdao;
    }
    public LoginService getLoginService() {
        return loginService;
    }
    @Autowired
    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    @RequestMapping("/AddStudent")
    public String AddStudent(@ModelAttribute Student student, HttpServletRequest request){
        HttpSession session = request.getSession();
        Student student1 = new Student();
        if (student.getId()!=null){
            student1 = loginService.FindstudentbyId(student.getId());
        }
        if(student1!=null){
            session.setAttribute("result1","该用户ID已存在！");
            return "register";
        }else{
            String  str = loginService.Addstudent(student);
            if("login".equals(str)){
                session.setAttribute("result","注册成功，请登录....");
            }else{
                session.setAttribute("result","注册失败，请重新填写信息！");
            }
        }
//        System.out.println(student.getName()+student.getStudentid()+student.getPassword()+student.getProfessiona()+student.getPhonenumber());
        return "/login";
    }

    @RequestMapping("/Toregister")
    public String Toregister(){
        return "register";
    }
    @RequestMapping("/Tologin")
    public String Tologin(){
        return "login";
    }
    @RequestMapping("/Tologinout")
    public String Tologinout(){return "login";}
    @RequestMapping("/Logincheck")
    public String Logincheck(String id, String password, String role,HttpServletRequest request){
        HttpSession session = request.getSession();
        String str = loginService.LoginCheck(id,password,role);
        List<Announceme> list1 = adminService.findannouncemeall(1,10);
        PageInfo pageInfoAA= new PageInfo(list1);
        session.setAttribute("pageInfoAA",pageInfoAA);
        if ("login".equals(str)){
            session.setAttribute("result","登录失败，该用不存在！");
            return str;
        }else if ("error".equals(str)){
            session.setAttribute("result","登录失败，密码错误！");
            return "login";
        }else {
            if("admin".equals(role)){                       //管理员
                Admin admin = loginService.FindAdminbyid(id);
                session.setAttribute("bean",admin);
                session.setAttribute("role",role);
                return str;//这里需要重定向
            }else if("teacher".equals(role)){                //老师
                Teacher teacher = loginService.FindTeacherbyid(id);
                session.setAttribute("bean",teacher);
                session.setAttribute("role",role);
                return str;//这里需要重定向
            }else {                                           //学生
                List<Test> list = testdao.Findtestandt(id);
                Student student = loginService.FindstudentbyId(id);
                session.setAttribute("bean",student);
                session.setAttribute("role",role);
                session.setAttribute("span",list.size());
                return str;//这里需要重定向
            }
        }
    }
    @RequestMapping("/finpublicdrefileall")
    public String finpublicdrefileall(HttpServletRequest request, @RequestParam(value = "page",defaultValue = "1")Integer page){
        List<Refile> list = loginService.findrefileall(page,8);
        PageInfo<Refile> pageInfore = new PageInfo<>(list);
        request.setAttribute("pageInfore",pageInfore);
        return "/publicrefile";
    }
}
