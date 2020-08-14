package com.hjb.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

public class Filedup {
    public String filedup(HttpServletRequest request, List<MultipartFile> file,String name){
        String newFilename=null;
        //循环输出上传的文件
        for (MultipartFile f : file) {
            //获取上传文件的原始名称
            String oringinalFilename = f.getOriginalFilename();
            //设置上传文件的保存地址目录
            String dirPath = request.getServletContext().getRealPath("/upload/");
            File filePath = new File(dirPath);
            //如果文件地址不存在 则创建目录
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            //使用uuid重新命名上传的文件名称（上传人_uuid_原始文件名称）
             newFilename = name + "_" + UUID.randomUUID() + "_" + oringinalFilename;

            try {
                //使用MultipartFilr接口的方法完成文件上传到指定位置
                f.transferTo(new File(dirPath + newFilename));
            } catch (IOException e) {
                e.printStackTrace();
                return "error";
            }
        }
        return newFilename;
    }
}
