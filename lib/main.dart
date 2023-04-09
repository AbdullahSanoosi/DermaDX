import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection/About_us.dart';
import 'package:skin_detection/Widgets/button.dart';
import 'package:skin_detection/auth/main_page.dart';
import 'package:skin_detection/cameratestfile.dart';
import 'package:skin_detection/doctor_list.dart';
import 'package:skin_detection/login_page.dart';
import 'package:skin_detection/result.dart';
import 'home_page.dart';
import 'camera_page.dart';
import 'edit_profile.dart';
import 'create_account_page.dart';
import 'doctor_list.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: result(skin: "Monkeypox"),
      home: MainPage(),

    );
  }
}
