/*Fruit Buying codebase, where individual persons can buy fruits 
there are 3 main fruits for sale*/

class FruitSale {
  String? name;
  double? price;
  String? store;

  FruitSale(this.name, this.price, this.store);

  String? format() {
    return "This fruit $name costs $price naira";
  }

  String? whereToBuy() {
    return "You can get this fruit at $store store";
  }
  @override
  String toString() {
    return "FruitSale{name: $name, price: $price, store: $store}";
  }
}

//first type of fruit produce, the ApplePie

class EachFruit extends FruitSale {
  String? color;
  int? quantity;

  EachFruit(this.color, this.quantity, super.name, super.price, super.store);

  String? myOrder() {
    return "You ordered $quantity Apple Pie of color $color " +
        "at ${super.price} naira per one from store ${super.store}";
  }

  String? checkout() {
    double costPrice = quantity! * super.price!;
    return "Total cost for $quantity Apple Pie is $costPrice";
  }
}

void main() {
  var anyFruit = FruitSale("Apple Pie", 9.5, "Prime Mart");
  var fruit = EachFruit("Red", 80, "Apple Pie", 9.5, "Prestige");
  print(anyFruit);
  print(fruit.name);
  print(fruit.whereToBuy());
  print(fruit.myOrder());
  print(fruit.checkout());
}
