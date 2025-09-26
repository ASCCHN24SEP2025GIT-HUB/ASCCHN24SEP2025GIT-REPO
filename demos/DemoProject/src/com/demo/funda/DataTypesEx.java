package com.demo.funda;

public class DataTypesEx {
    public static void main(String[] args) {
        // List the primitive data types in Java
        System.out.println("Primitive Data Types in Java:");
        System.out.println("1. byte");
        System.out.println("2. short");
        System.out.println("3. int");
        System.out.println("4. long");
        System.out.println("5. float");
        System.out.println("6. double");
        System.out.println("7. char");
        System.out.println("8. boolean");

        // print the size of memory occupied by each data type
        System.out.println("\nSize of Primitive Data Types:");
        System.out.println("byte: " + Byte.BYTES + " bytes");
        System.out.println("short: " + Short.BYTES + " bytes");
        System.out.println("int: " + Integer.BYTES + " bytes");
        System.out.println("long: " + Long.BYTES + " bytes");
        System.out.println("float: " + Float.BYTES + " bytes");
        System.out.println("double: " + Double.BYTES + " bytes");
        System.out.println("char: " + Character.BYTES + " bytes");
      


        // assign default vaulues
        byte b = 0;
        short s = 0;
        int i = 0;
        long l = 0L;
        float f = 0.0f;
        double d = 0.0d;
        // The '\u0000' is the Unicode representation for the null character
        char c = '\u0000';
        boolean bool = false;
        System.out.println("\nDefault Values:");
        System.out.println("byte: " + b);   
        System.out.println("short: " + s);
        System.out.println("int: " + i);
        System.out.println("long: " + l);
        System.out.println("float: " + f);
        System.out.println("double: " + d);
        System.out.println("char: " + c);
        System.out.println("boolean: " + bool);

        // assignm the max and min values to the datatypes
        System.out.println("\nMax and Min Values:");
        System.out.println("byte: " + Byte.MIN_VALUE + " to " + Byte.MAX_VALUE);
        System.out.println("short: " + Short.MIN_VALUE + " to " + Short.MAX_VALUE);
        System.out.println("int: " + Integer.MIN_VALUE + " to " + Integer.MAX_VALUE);
        System.out.println("long: " + Long.MIN_VALUE + " to " + Long.MAX_VALUE);
        System.out.println("float: " + Float.MIN_VALUE + " to " + Float.MAX_VALUE);
        System.out.println("double: " + Double.MIN_VALUE + " to " + Double.MAX_VALUE);
        System.out.println("char: " + (int) Character.MIN_VALUE + " to " + (int) Character.MAX_VALUE);
        System.out.println("boolean: " + "false and true");

    }
}
