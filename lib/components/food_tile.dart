//this is just to display in a nice format
import 'package:flutter/material.dart';

import 'package:restaurantapp/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  void Function()? onTap;
  FoodTile({required this.food,required this.onTap, super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        margin:const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //image
          Image.asset(food.imagePath,
          height: 140,),
          
          //text
          Text(food.name,style:const TextStyle(fontSize: 20,),),
      
          //price+rating
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('${food.price}L.E',),
              Row(
                children:  [
                  const Icon(Icons.star,
                  color: Color.fromARGB(255, 242, 226, 81),),
                  Text(food.rating,style:const TextStyle(color:  Color.fromARGB(255, 50, 43, 43),fontSize: 15),),
                ],
              ),
              
      
            ]),
          )
      
        ]),
      ),
    );
  }
}
