import 'package:flutter/material.dart';
//import 'MyHomePage.dart';
import 'LoginPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
