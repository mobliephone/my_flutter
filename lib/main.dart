import 'package:flutter/material.dart';
import 'package:my_flutter/view/MTabBarBottomWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MTabBarBottomWidget(),
    );
  }
}