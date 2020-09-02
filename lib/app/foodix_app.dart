import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodix/ui/home/home_page.dart';

class FoodixApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}