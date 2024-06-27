/*This code works on the principle of object oriented programming and is used 
to calculate the mean, median and mode of a given piece of data.
Sample: [2, 3, 4, 5, 6]
mean: 4.0
median: 4.0
mode: none
*/

import "dart:io";

class Statistics {
  List<int> dataValues = [2, 3, 4, 5, 6];

  List<int> exchangeSort(data) {
    List<int> data = this.dataValues;
    for (int i = 0; i <= data.length - 1; i++) {
      for (int j = 0; j <= data.length - 1; j++) {
        if (data[i] > data[j]) {
          int temp = data[i];
          data[i] = data[j];
          data[j] = temp;
        }
      }
    }
    return data;
  }

  double mean(data) {
    List<int> data = this.dataValues;
    int sum = 0;
    for (int i = 0; i <= data.length - 1; i++) {
      sum += data[i];
    }
    return sum / data.length;
  }

  double median(data) {
    List<int> data = this.dataValues;
    List<int> sortedData = exchangeSort(data);
    int howManyNums = sortedData.length;
    if (howManyNums % 2 == 0) {
      int middleNum = howManyNums ~/ 2;
      return (sortedData[middleNum] +
              sortedData[middleNum + 1]) / 2;
    }else{
      return sortedData[(howManyNums ~/ 2) + 1].toDouble();
    }
  }
}
