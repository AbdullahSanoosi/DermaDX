import 'package:flutter/material.dart';
import 'package:skin_detection/Widgets/button.dart';
import 'package:skin_detection/Widgets/text_field.dart';

// ignore: camel_case_types
class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

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
                const mybutton(),
              ]),
            )));
  }
}
