import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:skin_detection/About-us.dart';
=======
import 'package:skin_detection/About_us.dart';
import 'package:skin_detection/Widgets/button.dart';
>>>>>>> Stashed changes
import 'package:skin_detection/auth/main_page.dart';
import 'package:skin_detection/login_page.dart';
import 'home_page.dart';
import 'camera_page.dart';
import 'edit_profile.dart';
import 'create_account_page.dart';
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
<<<<<<< Updated upstream
=======
      // home: result(skin: "Monkeypox"),
>>>>>>> Stashed changes
      home: MainPage(),
      // home: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if(snapshot.hasData){
      //       return const LoginPage(); //if user logged in
      //     }else{
      //       return login(); //if user logged out
      //     }
      //     return login();
      //   },
      // ),
    );
  }
}
