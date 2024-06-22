void main(){

  fizzbuzz(){

    for(int counter = 1; counter <= 100; counter++){
      if (counter % 3 == 0 && counter % 5 == 0){
        print("${counter}fizzbuzz");
      }
      else if(counter % 5 == 0){
        print("${counter}buzz");
      }
      else if(counter % 3 == 0){
        print("${counter}fizz");
      }
      else{
        print(counter);
      }
    }
  }
  fizzbuzz();
}