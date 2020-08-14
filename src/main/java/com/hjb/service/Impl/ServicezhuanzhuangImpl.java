package com.hjb.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hjb.dao.Acountdao;
import com.hjb.daomain.Acount;
import com.hjb.service.Servicezhuanzhuang;

@Service
public class ServicezhuanzhuangImpl implements Servicezhuanzhuang {

	private Acountdao acountdao;
	public Acountdao getAcountdao() {
		return acountdao;
	}
	@Autowired
	public void setAcountdao(Acountdao acountdao) {
		this.acountdao = acountdao;
	}
	@Override
	public String zhuanzhuang(int id1, int id2,int money) {
		String result="";
		Acount ac1=acountdao.findAcountbyid(id1);
		Acount ac2=acountdao.findAcountbyid(id2);
		if(ac1!=null&&ac2!=null){
			if(ac1.getMoney()>money){
				ac1.setMoney(ac1.getMoney()-money);
				ac2.setMoney(ac2.getMoney()+money);
				int num1=acountdao.updateAcount(ac1);
//				int  num3=10/0;
				int num2 =acountdao.updateAcount(ac2);
				if(num1>0&&num2>0){
					result="转账成功！";
				}else{
					result="转账失败！！";
				}
			}else{
				result="余额不足！";
			}
		}else{
			result="用户不存在！";
		}
		return result;
		
	}

}
