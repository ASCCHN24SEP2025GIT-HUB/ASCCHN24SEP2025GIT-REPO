package com.demo.check;

public class StaticEx {
    public static void main(String[] args) {
        Employee.companyName = "Ascendion";
        Employee employee1 = new Employee();
        employee1.employeeName = "John";
        Employee employee2 = new Employee();
        employee2.employeeName = "Rambo";

        System.out.println(Employee.companyName);
        System.out.println(employee1.companyName);
        System.out.println(employee2.companyName);
        System.out.println(employee1.employeeName);
        System.out.println(employee2.employeeName);
        employee1.companyName = "Ascendion Engg";
        System.out.println(Employee.companyName);
        System.out.println(employee1.companyName);
        System.out.println(employee2.companyName);
    }
}

class Employee {
    static String companyName;
    String employeeName;
}