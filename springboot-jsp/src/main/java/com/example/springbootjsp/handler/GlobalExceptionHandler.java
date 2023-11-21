package com.example.springbootjsp.handler;

import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;


public class GlobalExceptionHandler {

    /**
     * jsr 规范中的验证异常
     *
     * @param ex
     * @return
     */
    @ExceptionHandler(ConstraintViolationException.class)
    public Map constraintViolationException(ConstraintViolationException ex, HttpServletRequest request) {
//        log.warn("ConstraintViolationException:", ex);
        Set<ConstraintViolation<?>> violations = ex.getConstraintViolations();
        String message = violations.stream().map(ConstraintViolation::getMessage).collect(Collectors.joining(";"));
        Map<String, Object> map = new HashMap();

        map.put("msg", "数据不符合要求:" + message);
        return map;
    }

}
