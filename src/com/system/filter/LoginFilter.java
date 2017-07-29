package com.system.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter{

    @Override
    public void destroy() {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) arg0;
        HttpServletResponse response = (HttpServletResponse) arg1; 
        String currentURL = request.getRequestURI();
        String ctxPath = request.getContextPath();
        String targetURL = currentURL.substring(ctxPath.length());
        HttpSession session = request.getSession(false);
//        System.out.println(currentURL);
//        System.out.println(ctxPath);
//        System.out.println(targetURL);
//        filterChain.doFilter(request, response);
        String bj="/login.jsp";
        String successURL="/StudentProSystem1/blank.jsp";
        String errorURL="/StudentProSystem1/login.jsp";
        if(!targetURL.equals(bj)){
            if(session == null || session.getAttribute("userNow")==null){
                response.sendRedirect(errorURL);
                return ;
            }
            else {
                filterChain.doFilter(request, response);
            }
        }
        else {
            if(session == null || session.getAttribute("userNow")==null)
                filterChain.doFilter(request, response);
            else {
                response.sendRedirect(successURL);
                return ;
            }
        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub
        
    }

}
