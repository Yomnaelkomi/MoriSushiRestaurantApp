import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({required this.text,required this.onTap,super.key});
  final void Function()? onTap;
  final String text;


  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: const Color.fromARGB(255, 141, 59, 59),borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,style: const TextStyle(color: Colors.white),),
            const SizedBox(height: 25.0,),  
            //icon
            const Icon(Icons.arrow_forward,color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
