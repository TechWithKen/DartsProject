/*This code base would be used to show the working principle of object oriented
programming*/

class Dog {
  String? breed, color, name, gender;
  int? age;
  double? height;

  //Constructor for the class, or __init__ method for class
  Dog(String breed, color, name, gender, int age, double height) {
    this.breed = breed;
    this.color = color;
    this.name = name;
    this.gender = gender;
    this.age = age;
    this.height = height;
  }

  //Methods
  String? bark() {
    return "Woof, Woof Hi I am $name the dog";
  }

  String? run() {
    return "Hi $name the dog of breed $breed is Running";
  }

  String? sleep() {
    return "$name the dog is currently sleeping";
  }
}

void main() {
  Dog myDog = Dog("German-Shepherd", "black", "Rex", "Male", 10, 4.2);
  print(myDog.bark());
}
