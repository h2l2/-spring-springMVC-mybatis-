package com.hjb.interceptor;

import com.hjb.daomain.Student;
import com.hjb.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class CustomInterceptor extends HandlerInterceptorAdapter {
    private LoginService loginService;

    public LoginService getLoginService() {
        return loginService;
    }
    @Autowired
    public void setStudentService(LoginService loginService) {
        this.loginService = loginService;
    }

    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler)throws Exception {
        Student student=null;
        HttpSession session = request.getSession();
       /* JSONObject object = new JSONObject();
        object.put("result","该用户ID已存在！");
        response.setContentType("text/javascript;charset=utf-8");
        response.setCharacterEncoding("utf-8");*/
        String studentid = request.getParameter("studentid");
        if (studentid!=null){
            student = loginService.FindstudentbyId(studentid);
        }
        if(student!=null){
//            response.getWriter().write(object.toString());
            session.setAttribute("result","该用户ID已存在！");
            response.sendRedirect("login.jsp");
            return false;
        }else{
            return true;
        }
    }
}
