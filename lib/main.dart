
import 'package:calculator/screens/first_screen.dart';
import 'package:flutter/material.dart';

void  main() {
  runApp(const HomeScreeen());
  
}

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme:ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const FirstScreen(),
      
      
    );
    
  }
}