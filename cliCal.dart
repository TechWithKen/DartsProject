/* This codebase works on the principle of modularism by creating different functions to help
peform certain operations and build a fully functional calculator */

import "dart:io";
import "getinput.dart";

addition(int a, int b){
    return "Result: ${a + b}";
}
subtraction(int a, int b){
    return "Result: ${a - b}";
}
multiplication(int a, int b){
    return "Result: ${a * b}";
}
division(int a, int b){
    return "Result: ${a / b}";
}
factorial(int a){
    return "Result: ${getFactorial(a)}";
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
    return [fiFirstNumber, fiSecondNumber];
}
void main(){
  print("Enter the operation you would like to perform: 1: addition, 2: subtraction, 3: multiplication 4: Division, 5: Factorial");
  var operation = stdin.readLineSync();

  if(operation == "1"){
    var numbers = twoInput();
    print(addition(numbers[0], numbers[1]));
  }
}