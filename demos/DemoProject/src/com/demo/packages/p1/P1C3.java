package com.demo.packages.p1;

public class P1C3 extends P1C1{
    public static void main(String[] args) {
        P1C3 p1C3 = new P1C3();
        p1C3.testAccess();
    }

//    protected void protectedMethod(){
//        System.out.println("protectedMethod!");
//    }
//
    public void testAccess(){
        P1C1 p1C1 = new P1C1();
//        System.out.println(p1C1.privateVar);
//        p1C1.privateMethod();
        System.out.println(p1C1.packagePrivateVar);
        p1C1.packagePrivateMethod();
        System.out.println(p1C1.protectedVar + "by creating an object of P1C1");
        p1C1.protectedMethod();
        System.out.println(protectedVar + " by inheritance");
        protectedMethod();
        System.out.println(p1C1.publicVar);
        p1C1.publicMethod();
    }
}
