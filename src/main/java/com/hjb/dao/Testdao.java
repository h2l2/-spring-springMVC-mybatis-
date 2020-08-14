package com.hjb.dao;

import com.hjb.daomain.Test;

import java.util.List;

public interface Testdao {
     public int Addtest(Test test);
     public Test Findtestallbyid(String id);
     public List<Test> Findtestallbytid(String tid);
     public List<Test> Findtestandt(String sid);
     public int Delecttest(String id);
     public int Updatetest(Test test);
     public List<Test> Findtestandtt(String cid);
     public List<Test> Findtestbycid(String cid);
}
