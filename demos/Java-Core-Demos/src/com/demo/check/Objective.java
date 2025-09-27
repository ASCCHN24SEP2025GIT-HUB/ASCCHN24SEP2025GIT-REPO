package com.demo.check;

class TryCatchFinally
{
public static void main(String args[])
    {
        try
        {
            int var1, var2 ;
            var2 = 0;
            var1 = 500 / var2;
            System.out.print("try");
        }
        catch(ArithmeticException e)
        {
            System.out.print("catch ");
        }
        finally
        {
            System.out.print("finally");
        }
    }
}