package com.hjb.controller;

import com.github.pagehelper.PageInfo;
import com.hjb.daomain.*;
import com.hjb.service.LoginService;
import com.hjb.service.StudentService;
import com.hjb.utils.Filedownload;
import com.zhuozhengsoft.pageoffice.OpenModeType;
import com.zhuozhengsoft.pageoffice.PageOfficeCtrl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StudentController {
    private int num=0;
    private StudentService studentService;
    private LoginService loginService;

    public LoginService getLoginService() {
        return loginService;
    }
    @Autowired
    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    public StudentService getStudentService() {
        return studentService;
    }
    @Autowired
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    @RequestMapping("/Tostudentlist")
    public String Tostudentlist(){
        return "student/studentlist";
    }
    @RequestMapping("/Toshowmessage")
    public String Toshowmessage(){return "student/showmessage";}
    @RequestMapping("/Tospdcorrect")
    public String Tospdcorrect(){return "student/spdcorrect";}
    @RequestMapping("/Tosmessageadd")
    public String Tosmessageadd(){return "student/smessageadd";}
    @RequestMapping("/Toupfiles")
    public String Toupfiles(){return "student/upfiles";}
    @RequestMapping("/Upstudentpd")
    public String Upstudentpd(String id, String pd,String password,HttpServletRequest request){
        HttpSession session = request.getSession();
        System.out.println(pd);
        String str = studentService.UpStudentpd(id,password,pd);
        if("success".equals(str)){
            session.setAttribute("resultup","修改成功，请重新登录！");
            return "/success";
        }else if ("error".equals(str)){
            session.setAttribute("resultpds","修改失败，请联系管理员！");
            return "/student/spdcorrect";
        }else {
            session.setAttribute("resultpds","原密码输入不正确！");
            return "/student/spdcorrect";
        }
    }
    @RequestMapping("/Findallcourseandt")
    public String Findallcourseandt(@RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "sid") String sid,HttpServletRequest request){
        List<Course> list = studentService.Findallcourseandt(page,5,sid);
        PageInfo<Course> pageInfoc = new PageInfo<>(list);
        request.setAttribute("pageInfoc",pageInfoc);
        return "/student/seletecourse";
    }
    @RequestMapping("/Addseletecourse")
    @ResponseBody
    public Map<String,String> Addseletecourse(@RequestBody SC sc,HttpServletRequest request){
        Map<String,String> map =new HashMap<>();
        int count = studentService.Addseletecourse(sc);
        request.getSession().setAttribute("span",count);
        if(count==100){
            map.put("data","操作失败！");
        }else {
            map.put("data","选课成功！");
        }
        return map;
    }
    @RequestMapping("/Findallcoursebycid")
    public String Findallcoursebycid(@RequestParam(value = "page", defaultValue = "1") Integer page,@RequestParam(value = "sid" ) String sid,HttpServletRequest request){
        if(studentService.Findscbysid(sid).isEmpty()){
            request.setAttribute("message","同学你的课表空空如也！");
            return "/student/mycourseshow";
        }else {
            List<Course> list = studentService.Findallcoursebycid(sid,page,5);
            PageInfo<Course> pageInfocid = new PageInfo<>(list);
            request.setAttribute("pageInfocid",pageInfocid);
            return "/student/mycourseshow";
        }
    }
    @RequestMapping("/deletescbysid")
    public String deletescbysid(@RequestParam(value = "cid") String cid,@RequestParam(value = "sid") String sid,HttpServletRequest request){
        SC sc = new SC();
        sc.setCid(cid);
        sc.setSid(sid);
        String str = studentService.deletescbysid(sc);
        request.setAttribute("messaged",str);
        return "/student/mycourseshow";
    }
    @RequestMapping("/Findtestandt")
    public String Findtestandt(@RequestParam(value = "page",defaultValue = "1") Integer page,
                               @RequestParam(value = "sid") String sid,HttpServletRequest request){
        List<Test> list = studentService.Findtestandt(page,5,sid);
        PageInfo<Test> pageInfotest = new PageInfo<Test>(list);
        request.setAttribute("pageInfotest",pageInfotest);
        return "/student/showtest";
    }
    @RequestMapping("/download")
    public ResponseEntity<byte[]> fileDownload(HttpServletRequest request, String filename) throws IOException {
        Filedownload filedownload = new Filedownload();
        return filedownload.filedownload(request,filename);
    }
    @RequestMapping("/openword")
    public String oopenword(HttpServletRequest request, HttpServletResponse response,
                            HttpSession session){
        String filename = (String) session.getAttribute("moban");
        if(filename!=null&&!filename.equals("")){
            num++;
            PageOfficeCtrl poCtrl=new PageOfficeCtrl(request);
            request.setAttribute("poCtrl", poCtrl);
            //设置服务页面
            poCtrl.setServerPage(request.getContextPath()+"/poserver.zz");
            //添加保存按钮
            poCtrl.addCustomToolButton("保存并关闭","Save",1);
            //设置保存的action
            poCtrl.setSaveFilePage("Filesave.jsp");
            String path = request.getServletContext().getRealPath("/doc//"+filename);
            //打开word
            poCtrl.webOpen(path, OpenModeType.docAdmin,"张三");
            if(num==2){
                session.removeAttribute("filename");
                session.removeAttribute("moban");
            }
            return "Word";
        }else {
            request.getSession().setAttribute("mes","请先选择实验模板！");
            return "/student/reportshow";
        }
    }
    @RequestMapping("/receivemoban")
    @ResponseBody
    public Map<String,String> receivemoban(@RequestBody Moban moban, HttpServletRequest request){
        request.getSession().setAttribute("moban",moban.getMoban());//1：C语言，2：C++，3：计网，4：Android
        Map<String,String> map = new HashMap<String, String>();
        if(moban.getMoban().equals("moban1.doc")){
            map.put("data","您已选择C语言实验报告模板，请开始编辑实验报告！");
        }else if(moban.getMoban().equals("moban2.doc")){
            map.put("data","您已选择C++实验报告模板，请开始编辑实验报告！");
        }else if(moban.getMoban().equals("moban3.doc")){
            map.put("data","您已选择计网实验报告模板，请开始编辑实验报告！");
        }else {
            map.put("data","您已选择Android实验报告模板，请开始编辑实验报告！");
        }
        return map;
    }
    @RequestMapping("/downloadfile")
    public ResponseEntity<byte[]> Downloadfile(HttpServletRequest request,HttpSession session,
                                               HttpServletResponse response) throws IOException {
        String filename;
        Object filename1 = (String)session.getAttribute("newfilename");
        System.out.println(filename1);
        if(filename1==null){
                return null;
        }else {
            filename =(String) filename1;
            Filedownload filedownload = new Filedownload();
            return filedownload.filedownload(request,filename);
        }
    }
    @RequestMapping("/Toreportshow")
    public String Toreportshow(HttpServletRequest request, @RequestParam(value = "ttid") String ttid,
                               @RequestParam(value = "cid") String cid, @RequestParam(value = "tid")String tid,
                               @RequestParam(value = "sid")String sid, @RequestParam(value = "endtime")Date endtime,
                               HttpSession session){
        Map<String,String> map = new HashMap<String,String>();
        String filename = (String) session.getAttribute("moban");
        map.put("ttid",ttid);
        map.put("cid",cid);
        map.put("tid",tid);
        map.put("sid",sid);
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        request.getSession().setAttribute("endtime",dateFormat.format(endtime));
        request.getSession().setAttribute("map",map);
        if(filename==null){
            request.getSession().setAttribute("mes","请先选择实验模板再进行操作！");
        }else {
            String str = null;
            if(filename.equals("moban1.doc")){
                str = "当前已选择C语言实验报告模板";
            }else if(filename.equals("moban2.doc")){
                str = "当前已选择C++实验报告模板";
            }else if(filename.equals("moban3.doc")){
                str = "当前已选择计网实验报告模板";
            }else {
                str = "当前已选择Android实验报告模板";
            }
            request.getSession().setAttribute("mes",str);
        }

        return"student/reportshow";
    }
    @RequestMapping("/upreport")
    @ResponseBody
    public Map<String,String> upreport(@RequestBody Moban moban,HttpServletRequest request,
                                       HttpSession session){
        Map<String,String> map = new HashMap<String, String>();
        String reportname;
        Object reportname1 =session.getAttribute("newfilename");
        if(reportname1==null){
            map.put("data","暂时没有实验报告可提交哦！");
            return map;
        }else {
            reportname = (String)reportname1;
            Map<String,String> mapp = (Map<String,String>)session.getAttribute("map");
            Report report = new Report();
            report.setName(reportname);
            report.setSid(mapp.get("sid"));
            report.setTid(mapp.get("tid"));
            report.setCid(mapp.get("cid"));
            report.setTtid(mapp.get("ttid"));
            String str = studentService.Addreport(report);
            map.put("data",str);
            return map;
        }
    }
    @RequestMapping("/Findgradeandc")
    public String Findgradeandc(@RequestParam(value = "sid") String sid,HttpServletRequest request){
        List<SC> listgra = studentService.Findgradeandc(sid);
        request.setAttribute("listgra",listgra);
        return "student/mygrade";
    }
    @RequestMapping("/Upfiles")
    public String Upfiles( String sid,String about,HttpServletRequest request,
                          @RequestParam("file") List<MultipartFile> file) {
        String str = null;
        try {
            str = studentService.addrefiles(sid, request, about,file);
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        request.setAttribute("resultfs", str);
        return "student/upfiles";
    }
    @RequestMapping("/findrefilebysid")
    public String findrefilebysid(String sid,HttpServletRequest request){
        List<Refile> list = studentService.findrefilebysid(sid);
        request.setAttribute("list",list);
        return "student/showfiles";
    }
    @RequestMapping("/Updatestudent")
    @ResponseBody
    public Map<String,String>Updatestudent(@RequestBody Student student){
        Map<String,String> map = new HashMap<String, String>();
        String str = studentService.updatestudent(student);
        map.put("data",str);
        return map;
    }
    @RequestMapping("/showmessage")
    public String showmessage(HttpServletRequest request,@RequestParam(value = "id") String id){
        Student student = loginService.FindstudentbyId(id);
        request.setAttribute("student",student);
        return "student/showmessage";
    }
}
