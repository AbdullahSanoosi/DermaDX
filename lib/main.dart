import 'package:flutter/material.dart';
import 'package:skin_detection/About-us.dart';
import 'package:skin_detection/login_page.dart';
import 'home_page.dart';
import 'camera_page.dart';
import 'edit_profile.dart';
import 'create_account_page.dart';
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateAccount(),
    );
  }
}
