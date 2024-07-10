import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/components/button.dart';
import 'package:restaurantapp/models/food.dart';
import 'package:restaurantapp/models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  const FoodDetailsPage({required this.food, super.key});
  final Food food;
  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //quantity
  int quantitycount = 0;
  //decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantitycount > 0) {
        quantitycount--;
      }
    });
  }

  //increment quantity
  void incrementQuantity() {
    setState(() {
      quantitycount++;
    });
  }

  void addToCart() {
    //only add to cart if there is something in it
    if (quantitycount > 0) {
      //get access to shop
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.food, quantitycount);

      //let the user know it was successful
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            backgroundColor:const Color.fromARGB(255, 129, 41, 41),
                content:const Text('successfully added',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                actions: [
                  IconButton( 
                      onPressed: () {
                        //pop once to remove dialog box
                        Navigator.pop(context);

                        //pop again to previous screen
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.done),color: Colors.white,),
                ],
              ));
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        //list view of food details
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                //image
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),
                const SizedBox(
                  height: 25,
                ),

                //rating
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 242, 226, 81),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    //rating number
                    Text(
                      widget.food.rating,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //food name
                Text(
                  widget.food.name,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),

                //description
                const Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 13, 13, 13)),
                ),
                const SizedBox(
                  height: 10,
                ),

                Text(
                  widget.food.description,
                  style: const TextStyle(height: 2),
                ),
              ],
            ),
          ),
        ),
        //price + quantity + addTocart
        Container(
            color: const Color.fromARGB(255, 129, 41, 41),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                //price+qantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${widget.food.price}L.E",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),

                    //quantity
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 141, 59, 59),
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                        width: 40,
                        child: Center(
                            child: Text(
                          quantitycount.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))),

                    //quantity count

                    //plus button
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 141, 59, 59),
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),

                //button add to cart
                MyButton(text: 'Add to cart', onTap: addToCart),
              ],
            ))
      ]),
    );
  }
}
