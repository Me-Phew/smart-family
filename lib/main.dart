import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Smart Family',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
