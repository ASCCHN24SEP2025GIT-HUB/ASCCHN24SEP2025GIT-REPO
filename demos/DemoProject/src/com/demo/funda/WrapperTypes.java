package com.demo.funda;

public class WrapperTypes {
    public static void main(String[] args) {
        // Example to demonstrate methods of Float wrapper
        float floatPrimitive = 10.5f;
        Float floatObj = Float.valueOf(floatPrimitive);
        System.out.println("Float value: " + floatObj);

// Some common methods used in real-time applications
// isNaN() method checks if the value is NaN (Not a Number)
// Example of isNaN() method. The below produces NaN because of 0.0/0.0 which is undefined
        float nanValue = 0.0f / 0.0f; // This will produce NaN
        Float nanObj = Float.valueOf(nanValue);

        System.out.println("isNaN: " + floatObj.isNaN());
        System.out.println("isNaN (NaN value): " + nanObj.isNaN());
        // other methods
        System.out.println("isInfinite: " + floatObj.isInfinite());
        System.out.println("toString: " + floatObj +"Float");
        System.out.println("hashCode: " + floatObj.hashCode());
        System.out.println("compareTo (with 10.5f): " + floatObj.compareTo(10.5f));
        System.out.println("compareTo (with 20.5f): " + floatObj.compareTo(20.5f));
        System.out.println("compareTo (with 20.5f): " + floatObj.compareTo(5.5f));
        System.out.println("equals (with 10.5f): " + floatObj.equals(10.5f));

        // find the difference between two float values
        Float anotherFloatObj = Float.valueOf(20.5f);
        System.out.println("Difference between two float values: " + (anotherFloatObj - floatObj));

    }

}
