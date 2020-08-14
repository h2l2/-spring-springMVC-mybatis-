package com.hjb.service.Impl;

import com.github.pagehelper.PageHelper;
import com.hjb.dao.*;
import com.hjb.daomain.*;
import com.hjb.service.StudentService;
import com.hjb.utils.Filedup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Service
public class StudentServiceImpl implements StudentService {
    private Studentdao studentdao;
    private Coursedao coursedao;
    private SCdao sCdao;
    private Testdao testdao;
    private Reportdao reportdao;
    private Sttdao sttdao;
    private Refiledao refiledao;
    public Refiledao getRefiledao() {
        return refiledao;
    }
    @Autowired
    public void setRefiledao(Refiledao refiledao) {
        this.refiledao = refiledao;
    }

    public Sttdao getSttdao() {
        return sttdao;
    }
    @Autowired
    public void setSttdao(Sttdao sttdao) {
        this.sttdao = sttdao;
    }

    public Reportdao getReportdao() {
        return reportdao;
    }
    @Autowired
    public void setReportdao(Reportdao reportdao) {
        this.reportdao = reportdao;
    }

    public Testdao getTestdao() {
        return testdao;
    }
    @Autowired
    public void setTestdao(Testdao testdao) {
        this.testdao = testdao;
    }

    public SCdao getsCdao() {
        return sCdao;
    }
    @Autowired
    public void setsCdao(SCdao sCdao) {
        this.sCdao = sCdao;
    }

    public Coursedao getCoursedao() {
        return coursedao;
    }
    @Autowired
    public void setCoursedao(Coursedao coursedao) {
        this.coursedao = coursedao;
    }

    public Studentdao getStudentdao() {
        return studentdao;
    }
    @Autowired
    public void setStudentdao(Studentdao studentdao) {
        this.studentdao = studentdao;
    }

    @Override
    public String UpStudentpd(String id, String password,String pd) {
        Map<String,String> hashmap = new HashMap<String, String>();
        hashmap.put("id",id);
        hashmap.put("password",password);
        Student student = studentdao.FindstudentbyId(id);
        if(student.getPassword().equals(pd)){
            int num = studentdao.Updatestudentpd(hashmap);
            if (num>0){
                return "success";
            }else {
                return "error";
            }
        }else {
            return "pderror";
        }

    }

    @Override
    public List<Course> Findallcourseandt(int page, int size,String sid) {
        PageHelper.startPage(page,size);
        return coursedao.Findallcourseandt(sid);
    }

    @Override
    public int Addseletecourse(SC sc) {
        Stt stt = new Stt();
        List<Test> list = testdao.Findtestbycid(sc.getCid());
        if(list!=null){
            for(Test t:list){
                if(t!=null){
                    stt.setStatus("未提交");
                    stt.setTtid(t.getId());
                    stt.setSid(sc.getSid());
                    sttdao.Addstt(stt);
                }
            }
        }
        int num = sCdao.Addseletecourse(sc);
        if(num>0){
            return list.size();
        }else {
            return 100;
        }
    }

    @Override
    public List<Course> Findallcoursebycid(String sid,int page,int size) {
        List<String> list = sCdao.Findcidbysid(sid);
        PageHelper.startPage(page,size);
        return coursedao.Findallcoursebycid(list);
    }

    @Override
    public String deletescbysid(SC sc) {
        Stt stt = new Stt();
        List<Test> list = testdao.Findtestbycid(sc.getCid());
        if(list!=null){
            for(Test t:list){
                if(t!=null){
                    stt.setTtid(t.getId());
                    stt.setSid(sc.getSid());
                    sttdao.Deletestt(stt);
                }
            }
        }
        int num = sCdao.deletescbysid(sc);
        if(num>0){
            return "操作成功，请刷新页面";
        }else {
            return "null";
        }
    }

    @Override
    public List<String> Findscbysid(String sid) {
        return sCdao.Findcidbysid(sid);
    }

    @Override
    public List<Test> Findtestandt(int page, int size, String sid) {
        PageHelper.startPage(page,size);
        List<Test> list = testdao.Findtestandt(sid);
        for (Test l:list){     //与当前SID 学生进行比较筛选，把其他同学的移除
            Iterator<Stt> it = l.getStts().iterator();
            while (it.hasNext()){
                Stt stt = it.next();
                if (!stt.getSid().equals(sid)){
                    it.remove();
                }
            }
        }
        return list;
    }

    @Override
    public String Addreport(Report report) {
        Stt stt = new Stt();
        stt.setStatus("已提交");
        stt.setSid(report.getSid());
        stt.setTtid(report.getTtid());
        int num = reportdao.Addreport(report);
        int num1 = sttdao.Updatestt(stt);
        if (num>0&&num1>0){
            return "提交成功！";
        }else {
            return "提交失败";
        }
    }

    @Override
    public List<SC> Findgradeandc(String sid) {
        return sCdao.Findgradeandc(sid);
    }

    @Override
    public String addrefiles(String sid, HttpServletRequest request, String about, List<MultipartFile> file) throws Exception {
        String newFilename;
        Filedup filedup = new Filedup();
        Student student = studentdao.FindstudentbyId(sid);
        Refile refile = new Refile();
        //判断上传文件是否存在
        if (!file.isEmpty() && file.size() > 0) {
            newFilename = filedup.filedup(request,file,student.getName());
        } else {
            return "error";
        }
        refile.setName(newFilename);
        refile.setSid(sid);
        refile.setTid(null);
        refile.setUptime(new Date());
        refile.setAbout(about);
        refile.setStatus("等待管理员审核");
        int num = refiledao.addrefile(refile);
        if(num>0){
            return "上传成功，等候管理员审核";
        }else {
            return "上传失败，请重新上传";
        }
    }

    @Override
    public List<Refile> findrefilebysid(String sid) {
        return refiledao.findrefilebysid(sid);
    }

    @Override
    public String updatestudent(Student student) {
        int num = studentdao.Updatestudent(student);
        if(num>0){
            return "操作成功！";
        }else {
            return "操作失败！";
        }
    }
}
