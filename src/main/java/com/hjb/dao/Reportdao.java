package com.hjb.dao;

import com.hjb.daomain.Report;
import com.hjb.daomain.Stt;
import com.hjb.daomain.Test;

import java.util.List;

public interface Reportdao {
    public int Addreport(Report report);
    public List<Report> Findroportbytest(Stt stt);
    public int Updatereportname(Report report);
}
