package com.hjb.controller;

import com.github.pagehelper.PageInfo;
import com.hjb.daomain.*;
import com.hjb.service.AdminService;
import com.hjb.service.LoginService;
import com.hjb.utils.Filedownload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {

    private LoginService loginService;
    private AdminService adminService;

    public LoginService getLoginService() {
        return loginService;
    }
    @Autowired
    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    public AdminService getAdminService() {
        return adminService;
    }
    @Autowired
    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    @RequestMapping("/Totop")
    public String Totop(){
        return "/top";
    }
    @RequestMapping("/Towelcome")
    public String Towelcome(){
        return "/welcome";
    }
    @RequestMapping("/Toadminlist")
    public String Toadminlist(){
        return "admin/adminlist";
    }
    @RequestMapping("/Toaddteacher")
    public String Toaddteacher(){
        return "admin/addteacher";
    }
    @RequestMapping("/Toupdcorrect")
    public String Toupdcorrect(){ return "admin/updcorrect";}
    @RequestMapping("/Toaddcourse")
    public String Toaddcourse(){return  "admin/addcourse";}
    @RequestMapping("/Toaddannounceme")
    public String Toaddannounceme(){return "admin/addannounceme";}
    @RequestMapping("/Toshowannounceme")
    public String Toshowannounceme(){return "admin/showannounceme";}
    @RequestMapping("/Toimportexcel")
    public String Toimportexcel(){return "admin/importexcel";}
    @RequestMapping("/Tofrome")
    public String Tofrome(){return "admin/frome";}
    @RequestMapping("/AddTeacher")
    public String AddTeacher(@ModelAttribute Teacher teacher, HttpServletRequest request){
        HttpSession session = request.getSession();
        String str = adminService.Addteacher(teacher);
        session.setAttribute("resultt",str);
        return "/admin/addteacher";
    }
    @RequestMapping("/FindTeacherall")
    public String FindTeacherall(@RequestParam(value = "page", defaultValue = "1") Integer page, HttpServletRequest request){
        HttpSession session = request.getSession();
        List<Teacher> list = adminService.Findteacherall(page,5);//分页
        PageInfo pageInfo = new PageInfo(list);
        session.setAttribute("pageInfo",pageInfo);
        return "/admin/showTeacher";
    }
    @RequestMapping("/FindStudentall")
    public String FindStudentall(@RequestParam(value = "page", defaultValue = "1") Integer page, HttpServletRequest request){
        HttpSession session = request.getSession();
        List<Student> list = adminService.Findstudentall(page,5);
        PageInfo pageInfo1 = new PageInfo(list);
        session.setAttribute("pageInfo1",pageInfo1);
        return "/admin/showStudent";
    }
    @RequestMapping("/Updatestudentpd")
    public String Updatestudentpd(String id,String password,String role,HttpServletRequest request){
        HttpSession session = request.getSession();
        String str = adminService.Updatestudentpd(id,password,role);
        session.setAttribute("resultpd",str);
        return "/admin/updcorrect";
    }
    @RequestMapping("/Addcourse")
    public String Addcourse(@ModelAttribute Course course,HttpServletRequest request){
            HttpSession session = request.getSession();
            String str = adminService.Addcourse(course);
            session.setAttribute("resultc",str);
            return "/admin/addcourse";
    }
    @RequestMapping("/FindCourseall")
    public String FindCourseall(@RequestParam(value = "page", defaultValue = "1") Integer page, HttpServletRequest request){
        HttpSession session = request.getSession();
        List<Course> list = adminService.Findcourseall(page,5);
        PageInfo pageInfoc = new PageInfo(list);
        session.setAttribute("pageInfoc",pageInfoc);
        return "/admin/showCourse";
    }
    @RequestMapping("/Deletecourse")
    public String Deletecourse(@RequestParam(value = "id") String id){
        String str = adminService.Deletecourse(id);
        return str;
    }
    @RequestMapping("/Deletestudent")
    public String Deletestudent(@RequestParam(value = "id") String id){
        String str = adminService.Deletestudent(id);
        return str;
    }
    @RequestMapping("/Deleteteacher")
    public String Deleteteacher(@RequestParam(value = "id") String id){
        String str = adminService.Deleteteacher(id);
        return str;
    }
    @RequestMapping("/Tocoursecorrect")
    public String Tocoursecorrect(@RequestParam(value = "id") String id,HttpServletRequest request){
        HttpSession session = request.getSession();
        Course course = adminService.Findcoursebyid(id);
        session.setAttribute("course",course);
        return "/admin/coursecorrect";
    }
    @RequestMapping("/Updatecourse")
    public String Updatecourse(@ModelAttribute Course course,HttpServletRequest request){
        HttpSession session = request.getSession();
        String str = adminService.Updatecourse(course);
        session.setAttribute("resultu",str);
        return "/admin/coursecorrect" ;
    }
    @RequestMapping("/addannounceme")
    @ResponseBody
    public Map<String,String>addannounceme(@RequestBody Announceme announceme){
        Map<String,String> map = new HashMap<String, String>();
        String str = adminService.Addannounceme(announceme);
        map.put("data",str);
        return map;
    }
    @RequestMapping("/findannouncemeall")
    public String findannouncemeall(@RequestParam(value = "page",defaultValue = "1") Integer page,HttpServletRequest request){
        List<Announceme> list = adminService.findannouncemeall(page,5);
        PageInfo pageInfoA= new PageInfo(list);
        request.setAttribute("pageInfoA",pageInfoA);
        return "/admin/showannounceme";
    }
    @RequestMapping("/deleteannounceme")
    @ResponseBody
    public Map<String,String>deleteannounceme(@RequestBody Announceme announceme){
        Map<String,String> map = new HashMap<String, String>();
        String str = adminService.deleteannouncemebyid(announceme);
        map.put("data",str);
        return map;
    }
    @RequestMapping("/findfindannouncemebyid")
    public String findfindannouncemebyid(@RequestParam(value = "id") int id,HttpServletRequest request){
        Announceme announceme = adminService.findfindannouncemebyid(id);
        request.getSession().setAttribute("announceme",announceme);
        return "/admin/updateannounceme";
    }
    @RequestMapping("/updateannounceme")
    @ResponseBody
    public Map<String,String>updateannounceme(@RequestBody Announceme announceme){
        Map<String,String> map = new HashMap<String, String>();
        String str = adminService.updateannounceme(announceme);
        map.put("data",str);
        return map;
    }
    @RequestMapping("/findrefileall")
    public String findrefileall(HttpServletRequest request,@RequestParam(value = "page",defaultValue = "1")Integer page){
        List<Refile> list = adminService.findrefileall(page,5);
        PageInfo<Refile> pageInfore = new PageInfo<>(list);
        request.setAttribute("pageInfore",pageInfore);
        return "/admin/examinerefile";
    }
    @RequestMapping("/updaterefilestatus")
    @ResponseBody
    public Map<String,String>updaterefilestatus(@RequestBody Refile refile){
        Map<String,String> map = new HashMap<String, String>();
        String str = adminService.updaterefilestatus(refile);
        System.out.println(refile.getStatus());
        System.out.println(refile.getId());
        map.put("data",str);
        return map;
    }
    @RequestMapping("/downloadrefile")
    public ResponseEntity<byte[]> downloadrefile(HttpServletRequest request, @RequestParam(value = "name")String name
    ) throws IOException {
        if(name==null){
            return null;
        }else {
            Filedownload filedownload = new Filedownload();
            return filedownload.filedownload(request,name);
        }
    }
    @RequestMapping("/importExcel")
    public String importExcel(HttpServletRequest request,
                           @RequestParam("file") MultipartFile file) throws Exception{
        InputStream in = file.getInputStream();
        String str = adminService.importExcelInfo(in,file);
        request.setAttribute("result",str);
        in.close();
        return "admin/importexcel";
    }
    @RequestMapping("/fromeaction")
    public String fromeaction(HttpServletRequest request){
        Map<String,Object> map = adminService.fromefind();
        request.setAttribute("list",map.get("list"));
        request.setAttribute("list1",map.get("list1"));
        return "admin/jiwangfrome";
    }
    @RequestMapping("/Cfromeaction")
    public String Cfromeaction(HttpServletRequest request){
        Map<String,Object> map = adminService.Cfromefind();
        request.setAttribute("Clist",map.get("Clist"));
        request.setAttribute("Clist1",map.get("Clist1"));
        return "admin/Cyuyanfrome";
    }
    @RequestMapping("/Cjiafromeaction")
    public String Cjiafromeaction(HttpServletRequest request){
        Map<String,Object> map = adminService.Cjiafromefind();
        request.setAttribute("Cjialist",map.get("Cjialist"));
        request.setAttribute("Cjialist1",map.get("Cjialist1"));
        return "admin/Cjiafrome";
    }
    @RequestMapping("/Androidfromeaction")
    public String Androidfromeaction(HttpServletRequest request){
        Map<String,Object> map = adminService.Afromefind();
        request.setAttribute("Alist",map.get("Alist"));
        request.setAttribute("Alist1",map.get("Alist1"));
        return "admin/Afrome";
    }
}
