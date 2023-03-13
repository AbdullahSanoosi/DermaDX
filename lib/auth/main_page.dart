import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection/auth/auth_page.dart';
import 'package:skin_detection/camera_page.dart';
import '../home_page.dart';
import '../login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const LoginPage();
          }else{
            return const AuthPage();
          }
        },),
    );
  }
}
