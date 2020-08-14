package com.hjb.service.Impl;

import com.github.pagehelper.PageHelper;
import com.hjb.dao.*;
import com.hjb.daomain.*;
import com.hjb.service.StudentService;
import com.hjb.service.TeacherService;
import com.hjb.utils.ExcelUtil;
import com.hjb.utils.Filedup;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.beans.IntrospectionException;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class TeacherServiceImpl implements TeacherService {
    private Teacherdao teacherdao;
    private Coursedao coursedao;
    private Studentdao studentdao;
    private Testdao testdao;
    private Sttdao sttdao;
    private SCdao sCdao;
    private Reportdao reportdao;
    private Refiledao refiledao;

    public Refiledao getRefiledao() {
        return refiledao;
    }
    @Autowired
    public void setRefiledao(Refiledao refiledao) {
        this.refiledao = refiledao;
    }

    public Reportdao getReportdao() {
        return reportdao;
    }
    @Autowired
    public void setReportdao(Reportdao reportdao) {
        this.reportdao = reportdao;
    }

    public SCdao getsCdao() {
        return sCdao;
    }
    @Autowired
    public void setsCdao(SCdao sCdao) {
        this.sCdao = sCdao;
    }

    public Testdao getTestdao() {
        return testdao;
    }
    @Autowired
    public void setTestdao(Testdao testdao) {
        this.testdao = testdao;
    }

    public Sttdao getSttdao() {
        return sttdao;
    }
    @Autowired
    public void setSttdao(Sttdao sttdao) {
        this.sttdao = sttdao;
    }

    public Studentdao getStudentdao() {
        return studentdao;
    }
    @Autowired
    public void setStudentdao(Studentdao studentdao) {
        this.studentdao = studentdao;
    }

    public Coursedao getCoursedao() {
        return coursedao;
    }
    @Autowired
    public void setCoursedao(Coursedao coursedao) {
        this.coursedao = coursedao;
    }

    public Teacherdao getTeacherdao() {
        return teacherdao;
    }
    @Autowired
    public void setTeacherdao(Teacherdao teacherdao) {
        this.teacherdao = teacherdao;
    }

    @Override
    public String UpTeacherpd(String id, String password, String pd) {
        Map<String,String> hashmap = new HashMap<String, String>();
        hashmap.put("id",id);
        hashmap.put("password",password);
        if(teacherdao.FindTeacherbyid(id).getPassword().equals(pd)){
            int num = teacherdao.Updateteacherpd(hashmap);
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
    public List<Course> Findteacherallcourse(String tid,int page,int size) {
        PageHelper.startPage(page,size);
        return coursedao.Findteacherallcourse(tid);
    }

    @Override
    public List<Student> Findstudentbycid(String cid, int page, int size) {
        PageHelper.startPage(page,size);
        return studentdao.Findstudentbycid(cid);
    }

    @Override
    public String Addtest(String id, String name, String time,Float percentage, String cid,String tid,
                          HttpServletRequest request, List<MultipartFile> file)throws Exception {
        String newFilename=null;
        Date date = new Date();
        int num1=0;
        Filedup filedup = new Filedup();
        if(testdao.Findtestallbyid(id)==null){
            if(tid.equals(coursedao.Findteacheridbycid(cid))){
                //判断上传文件是否存在
                if (!file.isEmpty() && file.size() > 0) {
                    newFilename = filedup.filedup(request,file,name);
                } else {
                    return "error";
                }
                Test test = new Test();
                test.setId(id);
                test.setName(name);
                test.setFilepath(newFilename);
                test.setStatime(date);//把日期转换成正常格式
                Calendar rightNow = Calendar.getInstance();
                rightNow.setTime(date);
                rightNow.add(Calendar.DAY_OF_YEAR,Integer.valueOf(time).intValue());//日期加time(时长)
                Date date1 = rightNow.getTime();
                test.setEndtime(date1);
                test.setCid(cid);
                test.setTid(tid);
                test.setPercentage(percentage);
                int num = testdao.Addtest(test);
                List<String> list = sCdao.Findsidbycid(cid);
                for (String list1:list){
                    Stt stt = new Stt();
                    stt.setTtid(id);
                    stt.setSid(list1);
                    stt.setStatus("未提交");
                    num1 = sttdao.Addstt(stt);
                }
                if (num>0){
                    return "发布成功！请刷新页面";
                }else {
                    return "error";
                }
            }else {
                return "您没有任课此ID的课程";
            }
        }else {
            return "请以15003_1形式重复发布同一ID课程任务";
        }


    }

    @Override
    public List<Test> Findtestallbytid(String tid, int page, int size)throws Exception{
       /* SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");*/
        PageHelper.startPage(page,size);
        List<Test> list = testdao.Findtestallbytid(tid);
        /*for (Test l:list){
            String time = dateFormat.format(l.getStatime());
            Date date = df.parse(time);
            System.out.println(date);
        }
        System.out.println("service:--------------------------------");
        System.out.println(list.get(0).getStatime());*/
        return list;
    }

    @Override
    public List<Student> Findstudentbyttid(String ttid, int page, int size) {
        PageHelper.startPage(page,size);
        List<Student> list = studentdao.Findstudentbyttid(ttid);
        for (Student l:list){
            Iterator<Stt> it = l.getStts().iterator();
            while (it.hasNext()){
                Stt stt = it.next();
                if (!stt.getTtid().equals(ttid)){
                    it.remove();
                }
            }
        }
        return list;
    }

    @Override
    public String deletetest(String id) {
        int num = testdao.Delecttest(id);
        int num1 = sttdao.Deletesst(id);
        if(num>0){
            return "success";
        }else {
            return "error";
        }
    }

    @Override
    public Test Findtestbyid(String id) {
        return testdao.Findtestallbyid(id);
    }

    @Override
    public String Updatetest(String id, String name, String time,Float percentage, String cid, String tid, HttpServletRequest request, List<MultipartFile> file) throws Exception {
        String newFilename=null;
        int num1=0;
        Filedup filedup = new Filedup();
        Test test = testdao.Findtestallbyid(id);
        if(test!=null){
            //判断上传文件是否存在
            if (!file.isEmpty() && file.size() > 0) {
                newFilename = filedup.filedup(request,file,name);
            } else {
                newFilename=test.getFilepath();
            }
                Test test1 = new Test();
                test1.setId(id);
                test1.setName(name);
                test1.setFilepath(newFilename);
                test1.setStatime(test.getStatime());//把日期转换成正常格式
                Calendar rightNow = Calendar.getInstance();
                rightNow.setTime(test.getEndtime());
                rightNow.add(Calendar.DAY_OF_YEAR,Integer.valueOf(time).intValue());//日期加time(时长)
                Date date = rightNow.getTime();
                test1.setEndtime(date);
                test1.setCid(cid);
                test1.setTid(tid);
                test1.setPercentage(percentage);
                int num = testdao.Updatetest(test1);
                if (num>0){
                    return "更新成功！请刷新页面";
                }else {
                    return "error";
                }
        }else {
            return "要更新的目标不存在！";
        }
    }

    @Override
    public List<Report> Findroportbytest(String sid, String ttid) {
        Stt stt = new Stt();
        stt.setTtid(ttid);
        stt.setSid(sid);
        return reportdao.Findroportbytest(stt);
    }

    @Override
    public int Updatereportname(Report report) {
        return reportdao.Updatereportname(report);
    }

    @Override
    public String Updatetegrade(Stt stt) {
        int num = sttdao.Updatetegrade(stt);
        if(num>0){
            return "提交成功！";
        }else {
            return "提交失败！";
        }
    }

    @Override
    public Stt Findgrade(Stt stt) {
        return sttdao.Findgrade(stt);
    }

    @Override
    public List<Test> Findtestandtt(String cid) {
        return testdao.Findtestandtt(cid);
    }

    @Override
    public String Updategradeall(SC sc) {
        int num = sCdao.Updategradeall(sc);
        if(num>0){
            return "提交成功！";
        }else {
            return "提交失败";
        }
    }

    @Override
    public XSSFWorkbook exportExcelInfo(String cid) throws InvocationTargetException, ClassNotFoundException, IntrospectionException, ParseException, IllegalAccessException {
        //根据条件查询数据，把数据装载到一个list中
        List<Student> list = studentdao.Findstudentbycid(cid);
        List<ExcelBean> excel=new ArrayList<>();
        Map<Integer,List<ExcelBean>> map=new LinkedHashMap<>();
        XSSFWorkbook xssfWorkbook=null;
        //设置标题栏
        excel.add(new ExcelBean("学号","id",0));
        excel.add(new ExcelBean("姓名","name",0));
        excel.add(new ExcelBean("专业","professiona",0));
        excel.add(new ExcelBean("联系方式","phonenumber",0));
        map.put(0, excel);
        String sheetName = cid+"选课名单";
        //调用ExcelUtil的方法
        xssfWorkbook = ExcelUtil.createExcelFile(Student.class, list, map, sheetName);
        return xssfWorkbook;
    }

    @Override
    public List<SC> Findgradeands(String cid) {
        return sCdao.Findgradeands(cid);
    }

    @Override
    public String addrefile(String tid, HttpServletRequest request, String about,List<MultipartFile> file) throws Exception {
        String newFilename;
        Filedup filedup = new Filedup();
        Teacher teacher = teacherdao.FindTeacherbyid(tid);
        Refile refile = new Refile();
        //判断上传文件是否存在
        if (!file.isEmpty() && file.size() > 0) {
            newFilename = filedup.filedup(request,file,teacher.getName());
        } else {
            return "error";
        }
        refile.setName(newFilename);
        refile.setSid(null);
        refile.setTid(tid);
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
    public List<Refile> findrefilebytid(String tid) {
        return refiledao.findrefilebytid(tid);
    }

    @Override
    public String deleterefilebyid(Refile refile) {
        int num = refiledao.deleterefilebyid(refile);
        if(num>0){
            return "删除成功，请刷新页面！";
        }else {
            return "删除失败，请联系管理员！";
        }
    }

    @Override
    public String Updateteacher(Teacher teacher) {
        int num = teacherdao.Updateteacher(teacher);
        if(num>0){
            return "操作成功！";
        }else {
            return "操作失败！";
        }
    }

}
