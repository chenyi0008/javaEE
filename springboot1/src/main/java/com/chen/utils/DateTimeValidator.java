package com.chen.utils;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DateTimeValidator {

    private static final String DATE_TIME_REGEX = "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$";

    public static boolean isValidDateTimeFormat(String input) {
        Pattern pattern = Pattern.compile(DATE_TIME_REGEX);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }

    public static void main(String[] args) {
        // Example usage
        String testString = "2023-11-19 12:30:00";
        if (isValidDateTimeFormat(testString)) {
            System.out.println("The string is in the correct format.");
        } else {
            System.out.println("The string does not match the expected format.");
        }
    }
}