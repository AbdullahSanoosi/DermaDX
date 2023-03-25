import 'package:flutter/material.dart';
import 'package:skin_detection/Widgets/button.dart';
import 'package:skin_detection/Widgets/text_field.dart';

// ignore: camel_case_types
class login extends StatelessWidget {
  login({super.key});

  //text editing controler
  final username = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
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

            mytextfield(
              Controller: username,
              hintText: "User name  or Email",
              obscureText: false,

            ),

            //enter pasword
            const SizedBox(height: 15),

            mytextfield(
              Controller: pass,
              hintText: "Enter password",
              obscureText: true,
            ),

            //forgotpass
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "forgot Password?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),

            //singin button
            const SizedBox(height: 25.0),
            mybutton(),
          ]),
        )));
  }
}
