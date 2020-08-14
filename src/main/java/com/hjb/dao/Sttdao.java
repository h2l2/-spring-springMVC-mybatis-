package com.hjb.dao;

import com.hjb.daomain.Stt;

public interface Sttdao {
    public int Addstt(Stt stt);
    public int Deletesst(String ttid);
    public int Updatestt(Stt stt);
    public int Updatetegrade(Stt stt);
    public Stt Findgrade(Stt stt);
    public int Deletestt(Stt stt);
}
