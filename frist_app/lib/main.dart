
import 'package:flutter/material.dart';
import 'package:frist_ap/screen.dart';
import 'package:frist_ap/welcome.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.routeName,
      routes:{
        WelcomeScreen.routeName:(context)=>WelcomeScreen(),
        HomeScreen.routeName:(context)=>HomeScreen()
      },
    );
  }
}