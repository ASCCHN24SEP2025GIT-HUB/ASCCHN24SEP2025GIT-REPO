package com.demo.funda;

public class EqualsVsIdentical {
//    static Float f22;
    public static void main(String[] args) {
//        System.out.println(f22);
//        System.out.println(f22.toString());
        Float f1 = new Float(5.5f);
        System.out.println(new Float(56.5f));
        Float f2 = new Float(5.5f);
        System.out.println(f1.equals(f2));
        Float f3 = f2;
        System.out.println(f3);
        f3 = 5.6f;
        System.out.println(f3);
        System.out.println(f2);
        System.out.println(f1.equals(f2));
        System.out.println(f1 == f2);
        f1 = f2;
        System.out.println(f1.equals(f2));
        System.out.println(f1 == f2);
    }
}
