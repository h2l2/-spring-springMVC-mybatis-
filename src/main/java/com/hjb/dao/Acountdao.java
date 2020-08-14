package com.hjb.dao;

import com.hjb.daomain.Acount;
import org.springframework.stereotype.Repository;

public interface Acountdao {
    public Acount findAcountbyid(int id);
    public int updateAcount(Acount acount);
}
