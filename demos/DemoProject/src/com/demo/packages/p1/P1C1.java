package com.demo.packages.p1;

public class P1C1 {
    //Private variables and methods are accessible within the class.
    private String privateVar = "private var";
    private void privateMethod(){
        System.out.println("Private Method!");
    }

     String packagePrivateVar = "package private var";
     void packagePrivateMethod(){
        System.out.println("PackagePrivateMethod!");
    }

    protected String protectedVar = "protected var";
    protected void protectedMethod(){
        System.out.println("protectedMethod!");
    }


    public String publicVar = "public var";
    public void publicMethod(){
        System.out.println("Public Method!");
    }

    public static void main(String[] args) {
        P1C1 p1C1 = new P1C1();
        System.out.println(p1C1.privateVar);
        p1C1.privateMethod();
        System.out.println(p1C1.packagePrivateVar);
        p1C1.packagePrivateMethod();
        System.out.println(p1C1.protectedVar);
        p1C1.protectedMethod();
        System.out.println(p1C1.publicVar);
        p1C1.publicMethod();
    }
}
