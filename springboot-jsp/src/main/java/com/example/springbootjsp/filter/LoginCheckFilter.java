package com.example.springbootjsp.filter;

import org.springframework.util.AntPathMatcher;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "loginCheckFilter",urlPatterns = {
        "/jsp/index.jsp",
        "/course/**"
})
public class LoginCheckFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;

        // Get the HttpSession
        HttpSession session = httpRequest.getSession();
        String  token = (String)session.getAttribute("token");

        if(token != null && token.equals("123"))filterChain.doFilter(servletRequest, servletResponse);
        else{
            HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
            httpResponse.sendRedirect("/jsp/403.jsp");
        }
    }
}
