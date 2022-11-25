import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
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
      scrollBehavior: CustomScrollBehavior(),
      title: 'JobUp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainIndex(),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}