import 'dart:io';

void main() {
  print("Please Enter the number you want to calculate the factorial of: ");
  String? userNumber = stdin.readLineSync();
  
  if (userNumber != null) {
    int? number = int.tryParse(userNumber);
    
    if (number != null) {
      int factorial(int numericValue) {
        if (numericValue <= 1) {
          return 1;
        }
        return numericValue * factorial(numericValue - 1);
      }

      print("The factorial of $number is ${factorial(number)}");
    } else {
      print("Invalid input. Please enter a valid number.");
    }
  } else {
    print("No input provided.");
  }
}
