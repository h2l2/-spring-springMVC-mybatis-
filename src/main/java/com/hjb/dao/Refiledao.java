package com.hjb.dao;

import com.hjb.daomain.Refile;

import java.util.List;

public interface Refiledao {
    public int addrefile(Refile refile);
    public List<Refile> findrefilebytid(String tid);
    public int deleterefilebyid(Refile refile);
    public List<Refile> findrefilebysid(String sid);
    public List<Refile> findrefileall();
    public int updaterefilestatus(Refile refile);
}
