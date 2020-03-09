import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: AppScreen(),
      ));
  }
}

 class AppScreen extends StatelessWidget {
   const AppScreen({Key key}) : super(key: key);
  
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Color(0xff02528A),
      
       body: Home(),
     );
   }
 }



