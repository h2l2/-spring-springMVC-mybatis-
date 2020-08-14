package com.hjb.utils;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class Filedownload {
    public ResponseEntity<byte[]>filedownload(HttpServletRequest request,String filename)throws IOException {
        Transcode transcode = new Transcode();
        //指定要下载文件的路径
        String path = request.getServletContext().getRealPath("/upload");
        //创建文件对象
        File file = new File(path+File.separator+filename);
        try {
            filename = transcode.getFilename(filename,request);
        }catch (Exception e){
            e.printStackTrace();
        }

        //设置响应头
        HttpHeaders headers = new HttpHeaders();
        //通过浏览器以下载的方式打开文件
        headers.setContentDispositionFormData("attachment", filename);
        //定义以流的形式下载返回文件数据
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //使用Spring MVC框架的ResponseEntity对象封装返回下载数据
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.OK);
    }
}
