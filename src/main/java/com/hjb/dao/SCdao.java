package com.hjb.dao;

import com.hjb.daomain.SC;

import java.util.List;

public interface SCdao {
    public int Addseletecourse(SC sc);
    public List<String> Findcidbysid(String sid);
    public List<String> Findsidbycid(String cid);
    public int deletescbysid(SC sc);
    public int Updategradeall(SC sc);
    public List<SC> Findgradeandc(String sid);
    public List<SC> Findgradeands(String cid);
    public List<SC> countstudent(String name);
}
