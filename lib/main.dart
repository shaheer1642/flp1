import 'package:flutter/material.dart';
import 'TopTabsController.dart';
import 'MainPage/MainIndex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobUp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainIndex(),
    );
  }
}
