import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img_1.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [
              SizedBox(height: 40,),
              Text('Hello!',style: TextStyle(fontFamily: 'AirBnbBold',fontSize: 40,color: Color(0xFFFFFFFF)),),
              SizedBox(height: 15,),
              Text('WELCOME TO SRI LANKAS BEST EVER DIGITAL SKIN CARE PLATFORM',
                style: TextStyle(
                    fontFamily: 'AirBnbMid',
                    fontSize: 16,color: Color(0xFFABA9A9)),
                textAlign: TextAlign.center,),
              SizedBox(height: 300,),
              //Sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF69BBE9),
                    borderRadius: BorderRadius.circular(9)
                  ),
                  child: Center(
                    child: Text('Sign In',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'AirBnbExBold',
                          fontSize: 20),),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color(0xFF194660),
                      borderRadius: BorderRadius.circular(32)
                  ),
                  child: Center(
                    child: Text('Create Account',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'AirBnbExBold',
                          fontSize: 15),),
                  ),
                ),
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
