package com.hjb.dao;

import com.hjb.daomain.Announceme;

import java.util.List;

public interface Announcemedao {
    public int addannounceme(Announceme announceme);
    public List<Announceme> findannouncemeall();
    public int deleteannounceme(Announceme announceme);
    public Announceme findfindannouncemebyid(int id);
    public int updateannounceme(Announceme announceme);
}
