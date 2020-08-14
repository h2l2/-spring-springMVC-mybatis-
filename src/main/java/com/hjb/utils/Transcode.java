package com.hjb.utils;

import eu.bitwalker.useragentutils.UserAgent;

import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import java.net.URLEncoder;

public class Transcode {
    public String getFilename(String filename, HttpServletRequest request)throws Exception{
        String userAgentString = request.getHeader("User-Agent");
        String browser = UserAgent.parseUserAgentString(userAgentString).getBrowser().getGroup().getName();
        if(browser.equals("Chrome") || browser.equals("Internet Exploer") || browser.equals("Safari")) {
            return URLEncoder.encode(filename,"utf-8").replaceAll("\\+", "%20");
        } else {
            return MimeUtility.encodeWord(filename);  //encodeWord(fileName);
        }

    }
}
