import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/components/button.dart';
import 'package:restaurantapp/components/food_tile.dart';
import 'package:restaurantapp/food_details.dart';
import 'package:restaurantapp/models/shop.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //food menu

  //navigate to food item details page
  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 225, 225),
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text(
          'MORI SUSHI',
          style: TextStyle(
            color: Color.fromARGB(255, 49, 42, 42),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartPage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo bar

          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 129, 41, 41),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'GET 32% PROMO',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    MyButton(text: 'Redeem', onTap: () {})
                  ],
                ),
                Image.asset(
                  'assets/images/sushi (2).png',
                  height: 100,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Search here..',
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          //menu List
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Food Menu',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),

          //exapnded just to fill the rest of the place
          Expanded(
            child: ListView.builder(//used for creating scrollable lists or grids of items.
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () {
                  navigateToFoodDetails(index);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //popular food
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/sushi (1).png',
                        height: 60,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Salmon eggs',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            '50L.E',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.favorite_outline,
                  color: Color.fromARGB(255, 40, 32, 32),
                  size: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
