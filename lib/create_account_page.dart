import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection/Widgets/button.dart';
import 'package:skin_detection/Widgets/text_field.dart';
import 'package:skin_detection/Widgets/app_bar.dart';
// ignore: camel_case_types
class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

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
                const Icon(
                  Icons.account_circle_outlined,
                  color: Color(0xFFABA9A9),
                  size: 300,
                ),
                //enter email
                const SizedBox(height: 10),

                mytextfield(
                  Controller: username,
                  hintText: "name",
                  obscureText: false,

                ),

                //enter pasword
                const SizedBox(height: 10),
                mytextfield(
                  Controller: username,
                  hintText: "email",
                  obscureText: false,

                ),
                const SizedBox(height: 10),
                mytextfield(
                  Controller: pass,
                  hintText: "enter password",
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                mytextfield(
                  Controller: pass,
                  hintText: "repeat password",
                  obscureText: true,
                ),

                //forgotpass
                const SizedBox(height: 10),

                //singin button
                const SizedBox(height: 25.0),
                mybutton(
                  buttonText: "Create Account",
                  onTap: (){},
                ),
                const SizedBox(height: 25.0),
                RichText(text: TextSpan(
                    text: 'Have An Account? ',
                    style: const TextStyle(
                        color: Color(0xFF989797),
                        fontFamily: 'AirBnbBoldMid',
                        fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign In',
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
                  )
                )
              ]),
            )));
  }
}
