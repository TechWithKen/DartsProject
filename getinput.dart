int getFactorial(anInteger){
  if (anInteger <= 1){
    return 1;
  }else{
    return anInteger * getFactorial(anInteger - 1);
  }
}
