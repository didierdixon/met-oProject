import 'package:flutter/material.dart';
import 'package:noteapp/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 

 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'meteoApp',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff081b25),
      ),
      debugShowCheckedModeBanner: false,
      
     home:MyHomePage(),
     
    );
  } 
}

