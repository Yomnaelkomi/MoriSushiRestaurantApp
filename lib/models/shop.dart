import 'package:flutter/material.dart';
import 'package:restaurantapp/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    //salmon
    Food(
        name: 'Salmon Sushi',
        price: '80.0',
        imagePath: 'assets/images/sushi (3).png',
        rating: '4.9',
        description: 'Salmon, avocado, cream cheese and teriyaki'),
    //tuna
    Food(
        name: 'Tuna Sushi',
        price: '60.0',
        imagePath: 'assets/images/sushi.png',
        rating: '3.5',
        description: 'Tuna, garlic, chives and yuzu sauce'),
  ];
  //customer cart
  final List<Food> _cart = [];

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
  

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
