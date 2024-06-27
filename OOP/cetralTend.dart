/*This code works on the principle of object oriented programming and is used 
to calculate the mean, median and mode of a given piece of data.
Sample: [2, 3, 4, 5, 6]
mean: 4.0
median: 4.0
mode: none
*/

import "dart:io";

class Statistics {
  List<int> exchangeSort(List<int> data) {
    for (int i = 0; i <= data.length - 1; i++) {
      for (int j = 0; j <= data.length - 1; j++) {
        if (data[i] < data[j]) {
          int temp = data[i];
          data[i] = data[j];
          data[j] = temp;
        }
      }
    }
    return data;
  }

  double mean(List<int> data) {
    int sum = 0;
    for (int i = 0; i <= data.length - 1; i++) {
      sum += data[i];
    }
    return sum / data.length;
  }

  double median(List<int> data) {
    List<int> sortedData = exchangeSort(data);
    int howManyNums = sortedData.length;
    if (howManyNums % 2 == 0) {
      int middleNum = howManyNums ~/ 2;
      return (sortedData[middleNum] + sortedData[middleNum + 1]) / 2;
    } else {
      return sortedData[(howManyNums ~/ 2) + 1].toDouble();
    }
  }

  int? mode(List<int> data) {
    //The list to serve as the parameter must be sorted
    Map<int, int> dataValues = {};
    for (int i = 0; i <= data.length - 1; i++) {
      dataValues[data[i]] =
          dataValues.containsKey(data[i]) ? dataValues[data[i]]! + 1 : 1;
    }
    int? maxNumber;
    int maxCount = 0;

    for (int key in dataValues.keys) {
      if (dataValues[key]! > maxCount) {
        maxNumber = key;
        maxCount = dataValues[key]!;
      }
    }
    return maxNumber;
  }

  int range(List<int> data) {
    //The list to serve as the parameter must be sorted
    data = exchangeSort(data);
    int min = data[0];
    int max = data[data.length - 1];
    return max - min;
  }
}

void main() {
  List<int> data = [2, 3, 4, 5, 6, 6, 5, 5];
  Statistics Stats = Statistics();
  print(Stats.mean(data));
  print(Stats.median(data));
  print(Stats.mode(data));
  print(Stats.range(data));
}
