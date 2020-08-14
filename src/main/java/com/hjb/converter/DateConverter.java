package com.hjb.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
//日期转换器
public class DateConverter implements Converter<String, Date> {
    @Override
    public Date convert(String arg) {
        SimpleDateFormat dataFromat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
            return  dataFromat.parse(arg);
        }catch (ParseException e){

            e.printStackTrace();
        }
        return null;
    }
}
