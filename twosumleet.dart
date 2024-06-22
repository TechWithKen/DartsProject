/*This code base is used to calculate two numbers in a list that adds up to a particular target

Sample 1:
Sample list: [2, 4, 6, 9, 12, 15]
target:18
Output: 12 and 6

Sample 2:
Sample list: [7, 5, 3, 4, 12, 21, 40]
target: 20
Output: No two numbers adds up to the target that was selected */

import "dart:io";

void main(){

  print("Enter the target(Two numbers that when you add together would give you a particular target): ");

  dynamic initialTarget = stdin.readLineSync();
  var target = int.parse(initialTarget ?? "0");
  var sampleList = [2, 3, 6, 9, 12, 3];

  twoSum(){
    for (var num in sampleList){
      int difference = target - num;
      if (sampleList.contains(difference) && difference != num){
        return "The two numbers are $difference and $num";
      }
    }
    return "No two numbers in the List adds up to the target $target";
  }
  print(twoSum());
}
