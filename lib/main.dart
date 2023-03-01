import 'package:flutter/material.dart';
import 'package:skin_detection/login_page.dart';
import 'package:skin_detection/sign-in-page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: login(),
      home: WelcomePage(),
    );
  }
}
