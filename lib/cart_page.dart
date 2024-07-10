import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/components/button.dart';
import 'package:restaurantapp/models/food.dart';
import 'package:restaurantapp/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});


  void removeFromCart(Food food,BuildContext context) {
    //get acces to the shop
    final shop = context.read<Shop>();
    //remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          backgroundColor: const Color.fromARGB(255, 129, 41, 41),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    //get food from cart
                    final Food food = value.cart[index];

                    //get food name
                    final String foodName = food.name;

                    //get food price
                    final String foodPrice = food.price;

                    //return list tile
                    return ListTile(
                      title: Text(foodName),
                      subtitle: Text(foodPrice),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          removeFromCart(food, context);
                        },
                      ),
                    );
                  }),
            ),
            //pay button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(text: 'Pay Now', onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
