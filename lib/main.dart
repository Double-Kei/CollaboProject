import 'package:flutter/material.dart';
import 'screens/home.dart';

void main(List<String> args) {
  runApp(const MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,  // Debug 리본삭제

      // Example : TopNavigatorBar
      home: DefaultTabController(length: 3, child: HomeScreen()),
      
      // Example : BottomNavigatorBar
      // home: HomeScreen(),
    );
  }
}