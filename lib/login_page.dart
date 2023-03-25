import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection/Widgets/app_bar.dart';
import 'package:skin_detection/Widgets/button.dart';
import 'package:skin_detection/Widgets/text_field.dart';
import 'package:skin_detection/Widgets/app_bar.dart';
import 'package:skin_detection/camera_page.dart';
import 'package:skin_detection/create_account_page.dart';
import 'package:skin_detection/forgot_password_page.dart';
// ignore: camel_case_types
class login extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const login({Key? key,required this.showRegisterPage}) : super(key: key);

  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login>{
  //text editing controler
  final _username = TextEditingController();
  final _password = TextEditingController();

  Future signIn() async {

    showDialog(context: context,
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _username.text.trim(),
        password: _password.text.trim()
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MyAppBar(),
        ),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 50),
              //logo
              const Icon(
                Icons.account_circle_outlined,
                color: Color(0xFFABA9A9),
                size: 300,
              ),

              //enter email
              const SizedBox(height: 25),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    controller: _username,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(13),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0x6FDCD6D6)),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: 'email',
                      hintStyle: const TextStyle(
                          fontFamily: 'AirBnbBook',
                          fontSize: 20,color: Color(0xFFABA9A9)),
                      fillColor: const Color(0xFFD9D9D9),
                      filled: true,
                    ),
                  ),
              ),

              //enter pasword
              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(13),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0x6FDCD6D6)),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'password',
                    hintStyle: const TextStyle(
                        fontFamily: 'AirBnbBook',
                        fontSize: 20,color: Color(0xFFABA9A9)),
                    fillColor: const Color(0xFFD9D9D9),
                    filled: true,
                  ),
                  obscureText: true,
                ),
              ),

              //forgotpass
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44.0),
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const ForgotPasswordPage();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "forgot Password?",
                        style: TextStyle(
                            color: Color(0xFF1D26FA),
                            fontFamily: 'AirBnbBoldMid',
                            fontSize: 15),
                  ),
                    ),]
                ),
              ),

              //singin button
              const SizedBox(height: 25.0),
              // mybutton(
              //   buttonText: "Sign in",
              //   onTap: (){
              //     signIn();
              //   },
              // ),
              ElevatedButton(
                  onPressed: (){
                    signIn();
                  },
                  child: const Text("Sign in")),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t Have an account? ',
                    style: TextStyle(
                          color: Color(0xFF989797),
                          fontFamily: 'AirBnbBoldMid',
                          fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color(0xFF1D26FA),
                          fontFamily: 'AirBnbBoldMid',
                          fontSize: 15),
                          )
                    ),
                ],
              )
            ]),
          ),
        )));
  }


}
