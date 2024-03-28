import 'package:flutter/material.dart';
import 'package:tes1/view/Screen_Page_Register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenPageRegister(),
    );
  }
}
