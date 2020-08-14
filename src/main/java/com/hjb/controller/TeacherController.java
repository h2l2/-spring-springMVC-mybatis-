package com.hjb.controller;

import com.github.pagehelper.PageInfo;
import com.hjb.daomain.*;
import com.hjb.service.LoginService;
import com.hjb.service.TeacherService;
import com.hjb.utils.Filedownload;
import com.zhuozhengsoft.pageoffice.OpenModeType;
import com.zhuozhengsoft.pageoffice.PageOfficeCtrl;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.beans.IntrospectionException;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class TeacherController {
    private TeacherService teacherService;
    private LoginService loginService;

    public LoginService getLoginService() {
        return loginService;
    }
    @Autowired
    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    public TeacherService getTeacherService() {
        return teacherService;
    }

    @Autowired
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @RequestMapping("/Toteacherlist")
    public String Toteacherlist() {
        return "teacher/teacherlist";
    }

    @RequestMapping("/Toshowmessaget")
    public String Toshowmessaget() {
        return "teacher/showmessaget";
    }

    @RequestMapping("/Totpdcorrect")
    public String Totpdcorrect() {
        return "teacher/tpdcorrect";
    }

    @RequestMapping("/Totmessageadd")
    public String Totmessageadd() {
        return "teacher/tmessageadd";
    }
    @RequestMapping("/Tomaycourse")
    public String Tomaycourse(){return "/teacher/mycourse";}
    @RequestMapping("/Togradefrom")
    public String Togradefrom(){return "/teacher/gradefrom";}
    @RequestMapping("/Toupfile")
    public String Toupfile(){return "/teacher/upfile";}
    @RequestMapping("/Toaddtest")
    public String Toaddtest(HttpSession session) {
        System.out.println(session.getAttribute("filename"));
        return "teacher/addtest";
    }

    @RequestMapping("/Upteacherpd")
    public String Upteacherpd(String id, String pd, String password, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String str = teacherService.UpTeacherpd(id, password, pd);
        if ("success".equals(str)) {
            session.setAttribute("resultup", "修改成功，请重新登录！");
            return "/success";
        } else if ("error".equals(str)) {
            session.setAttribute("resultpdt", "修改失败，请联系管理员！");
            return "/teacher/tpdcorrect";
        } else {
            session.setAttribute("resultpdt", "原密码输入不正确！");
            return "/teacher/tpdcorrect";
        }
    }

    @RequestMapping("/Findteacherallcourse")
    public String Findteacherallcourse(@RequestParam(value = "page", defaultValue = "1") Integer page
            , @RequestParam(value = "tid") String tid, HttpServletRequest request) {
        List<Course> list = teacherService.Findteacherallcourse(tid, page, 5);
        PageInfo<Course> pageInfot = new PageInfo<Course>(list);
        request.setAttribute("pageInfot", pageInfot);
        return "/teacher/mycourse";
    }
    @RequestMapping("/Findteacherallcourse1")
    public String Findteacherallcourse1(@RequestParam(value = "page", defaultValue = "1") Integer page
            , @RequestParam(value = "tid") String tid, HttpServletRequest request) {
        List<Course> list = teacherService.Findteacherallcourse(tid, page, 5);
        PageInfo<Course> pageInfot = new PageInfo<Course>(list);
        request.setAttribute("pageInfot", pageInfot);
        return "/teacher/gradecourse";
    }
    @RequestMapping("/Findstudentbycid")
    public String Findstudentbycid(@RequestParam(value = "page", defaultValue = "1") Integer page
            , @RequestParam(value = "cid") String cid, HttpServletRequest request) {
        List<Student> list = teacherService.Findstudentbycid(cid, page, 5);
        PageInfo<Student> pageInfosc = new PageInfo<Student>(list);
        request.setAttribute("pageInfosc", pageInfosc);
        request.getSession().setAttribute("cid", cid);
        return "/teacher/incoursestudent";
    }

    @RequestMapping("/Addtest")
    public String Addtest(String id, String name, String time, Float percentage, String cid, String tid,
                          HttpServletRequest request, @RequestParam("file") List<MultipartFile> file) {
        String str = null;
        try {
            str = teacherService.Addtest(id, name, time, percentage, cid, tid, request, file);
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        if (!str.equals("error")) {
            request.setAttribute("resultt", str);
            return "teacher/addtest";
        }
        return str;
    }

    @RequestMapping("/ToTest")
    public String ToTest(@RequestParam(value = "page", defaultValue = "1") Integer page,
                         @RequestParam(value = "tid") String tid, HttpServletRequest request) {
        List<Test> list = null;
        try {
            list = teacherService.Findtestallbytid(tid, page, 5);
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
//        System.out.println(list.get(0).getStatime().toString());
        PageInfo<Test> pageInfote = new PageInfo<Test>(list);
        request.setAttribute("pageInfote", pageInfote);
        return "teacher/Test";
    }

    @RequestMapping("/Findstudentbyttid")
    public String Findstudentbyttid(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                    @RequestParam(value = "ttid") String ttid, HttpServletRequest request) {
        List<Student> list = teacherService.Findstudentbyttid(ttid, page, 10);
        PageInfo<Student> pageInfost = new PageInfo<Student>(list);
        request.setAttribute("pageInfost", pageInfost);
        request.getSession().setAttribute("ttid", ttid);
        return "teacher/showsubmit";
    }

    @RequestMapping("/deletetest")
    public String deletetest(@RequestParam(value = "id") String id, HttpServletRequest request) {
        String str = teacherService.deletetest(id);
        if (str.equals("success")) {
            return "teacher/Test";
        } else {
            return str;
        }
    }

    @RequestMapping("/Totestupdate")
    public String Totestupdate(HttpServletRequest request, @RequestParam(value = "id") String id) {
        Test test = teacherService.Findtestbyid(id);
        request.getSession().setAttribute("test", test);
        return "teacher/testupdate";
    }

    @RequestMapping("/Updatetest")
    public String Updatetest(String id, String name, String time, Float percentage, String cid, String tid,
                             HttpServletRequest request, @RequestParam("file") List<MultipartFile> file) {
        String str = null;
        try {
            str = teacherService.Updatetest(id, name, time, percentage, cid, tid, request, file);
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        if (!str.equals("error")) {
            request.setAttribute("resultt", str);
            return "teacher/testupdate";
        }
        return str;
    }

    @RequestMapping("/Findroportbytest")
    public String Findroportbytest(@RequestParam(value = "sid") String sid, @RequestParam(value = "ttid") String ttid,
                                   HttpServletRequest request) {
        List<Report> list = teacherService.Findroportbytest(sid, ttid);
        Stt stt = new Stt();
        stt.setSid(sid);
        stt.setTtid(ttid);
        if(teacherService.Findgrade(stt)==null){
            request.setAttribute("grade",0);
        }else {
            request.setAttribute("grade",teacherService.Findgrade(stt).getGrade());
        }
        request.setAttribute("list", list);
        return "teacher/submitlist";
    }

    @RequestMapping("/teopenword")
    public String teopenword(HttpServletRequest request, HttpServletResponse response,
                             HttpSession session, String reportname, int reportid) {
        if (reportname != null && !reportname.equals("")) {
            try {
                PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
                request.setAttribute("poCtrl", poCtrl);
                //设置服务页面
                poCtrl.setServerPage(request.getContextPath() + "/poserver.zz");
                /*//添加保存按钮
                poCtrl.addCustomToolButton("保存并关闭", "Save", 1);
                //设置保存的action
                poCtrl.setSaveFilePage("Filesave.jsp");*/
                String path = request.getServletContext().getRealPath("/upload//" + reportname);
                //打开word
                poCtrl.webOpen(path, OpenModeType.docAdmin, "张三");

                return "Word";
            } catch (Exception e) {
                e.printStackTrace();
                return "error";
            } finally {
                String filename = (String) session.getAttribute("newFilename");
            }
        } else {
            request.getSession().setAttribute("mes", "实验报告丢失了，请联系管理员！");
            return "/teacher/submitlist";
        }
    }
    @RequestMapping("/tedownloadfile")
    public ResponseEntity<byte[]> Tedownloadfile(HttpServletRequest request, @RequestParam(value = "reportname")String reportname
                                               ) throws IOException {
        if(reportname==null){
            return null;
        }else {
            Filedownload filedownload = new Filedownload();
            return filedownload.filedownload(request,reportname);
        }
    }
    @RequestMapping("/Submitgrade")
    @ResponseBody
    public Map<String,String>Submitgrade(@RequestBody Stt stt){
        Map<String,String> map = new HashMap<String, String>();
        String str = teacherService.Updatetegrade(stt);
        System.out.println(stt.getGrade());
        map.put("data",str);
        return map;
    }
    @RequestMapping("/Submitgradeall")
    public String Submitgradeall(@RequestParam(value = "cid") String cid,HttpServletRequest request,
                                 @RequestParam(value = "page",defaultValue = "1") Integer page){
        int num;
        List<Student> list = teacherService.Findstudentbycid(cid, page, 1);
        List<Test> list1 = teacherService.Findtestandtt(cid);
        List<SC> list2 = teacherService.Findgradeands(cid);
        PageInfo<Student> pageInfogra = new PageInfo<Student>(list);
        request.setAttribute("pageInfogra",pageInfogra);
        request.setAttribute("Test",list1);
        request.setAttribute("SC",list2);
        request.getSession().setAttribute("cid",cid);
        request.getSession().setAttribute("count",list1.size());
        return "teacher/gradesubmit";
    }
    @RequestMapping("/Submitgradeall1")
    @ResponseBody
    public Map<String,String>Submitgradeall1(@RequestBody SC sc){
        Map<String,String> map = new HashMap<String, String>();
        String str = teacherService.Updategradeall(sc);
        map.put("data",str);
        return map;
    }
    @RequestMapping("/exportstudent")
    public void exportstudent(@RequestParam(value = "cid")String cid,HttpServletRequest request,
                                HttpServletResponse response)throws Exception{
        if(cid!=""){
            response.reset(); //清除buffer缓存
            Map<String,Object> map=new HashMap<String,Object>();
            // 指定下载的文件名，浏览器都会使用本地编码，即GBK，浏览器收到这个文件名后，用ISO-8859-1来解码，然后用GBK来显示
            // 所以我们用GBK解码，ISO-8859-1来编码，在浏览器那边会反过来执行。
            response.setHeader("Content-Disposition", "attachment;filename=\""+ new String(("选课名单" + ".xlsx").getBytes("gb2312"),  "iso8859-1") + "\"");
            response.setContentType("application/vnd.ms-excel;charset=UTF-8");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            XSSFWorkbook workbook=null;
            //导出Excel对象
            workbook = teacherService.exportExcelInfo(cid);
            OutputStream output;
            try {

                output = response.getOutputStream();
                BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
                bufferedOutPut.flush();
                workbook.write(bufferedOutPut);
                bufferedOutPut.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    @RequestMapping("/Findgradeands")
    public String Findgradeands(@RequestParam(value = "cid")String cid,HttpServletRequest request){
        List<SC> listgraf = teacherService.Findgradeands(cid);
        int grade0=0;
        int grade1=0;
        int grade2=0;
        int grade3=0;
        int grade4=0;
        for(SC sc:listgraf){
            if(sc.getGrade()==null){

            }else {
                if(sc.getGrade()>0 && sc.getGrade()<60){
                    grade0++;
                }else if(sc.getGrade()>60 && sc.getGrade()<70){
                    grade1++;
                }else if (sc.getGrade()>70 && sc.getGrade()<80){
                    grade2++;
                }else if (sc.getGrade()>80 && sc.getGrade()<90){
                    grade3++;
                }else {
                    grade4++;
                }
            }
        }
        request.getSession().setAttribute("grade0",grade0);
        request.getSession().setAttribute("grade1",grade1);
        request.getSession().setAttribute("grade2",grade2);
        request.getSession().setAttribute("grade3",grade3);
        request.getSession().setAttribute("grade4",grade4);
        request.setAttribute("listgraf",listgraf);
        request.getSession().setAttribute("cid",cid);
        return "teacher/gradefrome";
    }
    @RequestMapping("/Upfile")
    public String Upfile( String tid,String about,HttpServletRequest request,
                          @RequestParam("file") List<MultipartFile> file) {
        String str = null;
        try {
            str = teacherService.addrefile(tid, request, about,file);
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
        request.setAttribute("resultf", str);
        return "teacher/upfile";
    }
    @RequestMapping("/findrefilebytid")
    public String findrefilebytid(String tid,HttpServletRequest request){
        List<Refile> list = teacherService.findrefilebytid(tid);
        request.setAttribute("list",list);
        return "teacher/showrefile";
    }
    @RequestMapping("/deleterefilebyid")
    @ResponseBody
    public Map<String,String>deleterefilebyid(@RequestBody Refile refile){
        Map<String,String> map = new HashMap<String, String>();
        String str = teacherService.deleterefilebyid(refile);
        map.put("data",str);
        return map;
    }
    @RequestMapping("/Updateteacher")
    @ResponseBody
    public Map<String,String>Updateteacher(@RequestBody Teacher teacher){
        Map<String,String> map = new HashMap<String, String>();
        String str = teacherService.Updateteacher(teacher);
        map.put("data",str);
        return map;
    }
    @RequestMapping("/showmessaget")
    public String showmessaget(HttpServletRequest request,@RequestParam(value = "id") String id){
        Teacher teacher = loginService.FindTeacherbyid(id);
        request.setAttribute("teacher",teacher);
        return "teacher/showmessaget";
    }
}
