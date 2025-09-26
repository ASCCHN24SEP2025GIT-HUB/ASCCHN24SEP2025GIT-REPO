package com.demo.packages.p1;

public class P1C2 {
    public static void main(String[] args) {
        P1C1 p1C1 = new P1C1();
//        System.err.println(p1C1.privateVar);
//        p1C1.privateMethod();

        System.out.println(p1C1.packagePrivateVar);
        p1C1.packagePrivateMethod();

        System.out.println(p1C1.protectedVar);
        p1C1.protectedMethod();

        System.out.println(p1C1.publicVar);
        p1C1.publicMethod();
    }
}
