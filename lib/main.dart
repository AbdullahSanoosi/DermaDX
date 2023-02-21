import 'package:flutter/material.dart';
import 'login_page.dart';
import 'camera_page.dart';
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:CameraScreen(),
    );
  }
}
