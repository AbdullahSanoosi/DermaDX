import 'package:flutter/material.dart';
import 'package:skin_detection/create_account_page.dart';
import 'package:skin_detection/home_page.dart';
import 'package:skin_detection/login_page.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  //initially show login
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return login(showRegisterPage: toggleScreens);

    }else{
      return CreateAccount(showLoginPage: toggleScreens);
    }
  }
}
