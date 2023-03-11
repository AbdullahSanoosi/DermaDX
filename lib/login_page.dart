import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection/Widgets/app_bar.dart';
import 'package:skin_detection/Widgets/button.dart';
import 'package:skin_detection/Widgets/text_field.dart';
import 'package:skin_detection/Widgets/app_bar.dart';
// ignore: camel_case_types
class login extends StatelessWidget {
  login({super.key});

  //text editing controler
  final username = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: appBar(),
        ),
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
            mybutton(
              buttonText: "Sign in",
              onTap: (){},
            ),
            const SizedBox(height: 25.0),
            RichText(text: TextSpan(
              text: 'Don’t Have an account? ',
              style: const TextStyle(
                color: Color(0xFF989797),
                fontFamily: 'AirBnbBoldMid',
                fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                  text: 'Sign Up',
                  style: const TextStyle(
                      color: Color(0xFF1D26FA),
                      fontFamily: 'AirBnbBoldMid',
                      fontSize: 15),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('The button is clicked!');
                    },

                )
              ]
            ))
          ]),
        )));
  }
}
