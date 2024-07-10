import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/cart_page.dart';
import 'package:restaurantapp/intro_page.dart';
import 'package:restaurantapp/menu_page.dart';
import 'package:restaurantapp/models/shop.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=>Shop(),
    child: const MainApp(),));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,//This banner is intended to deter people from complaining that your app is slow when it's in debug mode.
        home:const IntroPage(),
        routes: {
          '/intropage':(context) => const IntroPage(),
          '/menuPage': (context) => const MenuPage(),
          '/cartPage': (context)=>const CartPage(),
        },
        );
  }
}
