package com.demo.check;

public class StringIdenticality {
    public static void main(String[] args) {
        String s1 = "yes" ;
        String s2 = "yes" ;
        String s3 = new String ( s1);

        System.out.println(s1==s3);
    }
}
