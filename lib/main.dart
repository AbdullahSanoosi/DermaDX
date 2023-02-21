import 'package:flutter/material.dart';
import 'package:skin_detection/All-pages/About-us.dart';
import 'package:skin_detection/All-pages/camera_page.dart';
import 'package:skin_detection/All-pages/login_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myaboutus(),
      // home:LoginPage(),
      // home: CameraScreen(),
    );
  }
}
