import "dart:io";

void main(){
  
  print("Please enter the number you want to calculate the factorial of: ");
  var initialNumber = stdin.readLineSync();

  var finalNumber = int.parse(initialNumber?? "1");

  int displayValue(){
    return finalNumber;
  }
  int getFactorial(anInteger){
    if (anInteger <= 1){
      return 1;
    }else{
      return anInteger * getFactorial(anInteger - 1);
    }
  }
  print("The Factorial of the number ${displayValue()} is ${getFactorial(displayValue())}");
}