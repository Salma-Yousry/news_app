import 'package:app_news/home/home_screen.dart';
import 'package:app_news/my_theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.LightTheme,
      initialRoute: HomeScreen.route_name ,
      routes:{
        HomeScreen.route_name : (context)=>HomeScreen(),
      },
    );
  }
}
