import 'package:flutter/material.dart';
import 'package:restaurantapp/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 129, 41, 41),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //shop name
            const SizedBox(height: 25.0),
            const Center(
                child: Text(
              'Mori Sushi',
              style: TextStyle(color: Colors.white, fontSize: 35),
            )),
            const SizedBox(
              height: 25.0,
            ),
            Image.asset(
              'assets/images/sushi (1).png',
              width: 150,
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                  child: Text(
                      'With its Brazilian origin and Japanese heritage, the Mori Sushi brand has redefined sushi in all its restaurants across Egypt. Made with a recipe of passion and quality.',
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, height: 2))),
            ),
            const SizedBox(
              height: 25.0,
            ),
            MyButton(
              text: 'get started',
              onTap: () {
                Navigator.pushNamed(context, '/menuPage');
              },
            ),
          ],
        ));
  }
}
