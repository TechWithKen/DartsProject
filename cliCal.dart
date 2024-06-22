/* This codebase works on the principle of modularism by creating different functions to help
peform certain operations and build a fully functional calculator */

import "dart:io";
import "getinput.dart" as external;

void main(){

    addition(int a, int b){
        return a + b;
    }
    subtraction(int a, int b){
        return a - b;
    }
    multiplication(int a, int b){
        return a * b;
    }
    division(int a, int b){
        return a / b;
    }
    factorial(int a){
        return external.getFactorial(a);
    }
    oneInput(){
        print("Enter the number: ");
        var initialIn = stdin.readLineSync();
        var finalIn = int.parse(initialIn ?? "0");
        return finalIn;
    }
    twoInput(){
        print("Enter the first number: ");
        var inFirstNumber = stdin.readLineSync();
        print("Enter the second number: ");
        var inSecondNumber = stdin.readLineSync();
        var fiFirstNumber = int.parse(inFirstNumber ?? "0");
        var fiSecondNumber = int.parse(inSecondNumber ?? "0");
        return fiFirstNumber, fiSecondNumber;
    }
    print("Enter the operation you would like to perform: 1: addition, 2: subtraction, 3: multiplication 4: Division, 5: Factorial");
    var operation = stdin.readLineSync();

    if(operation):
    
}