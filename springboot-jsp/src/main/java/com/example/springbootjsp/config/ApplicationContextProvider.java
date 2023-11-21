package com.example.springbootjsp.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

@Component
public class ApplicationContextProvider {

    private static ApplicationContext context;

    @Autowired
    public ApplicationContextProvider(ApplicationContext applicationContext) {
        setApplicationContext(applicationContext);
    }

    private static void setApplicationContext(ApplicationContext applicationContext) {
        context = applicationContext;
    }

    public static ApplicationContext getContext() {
        return context;
    }
}