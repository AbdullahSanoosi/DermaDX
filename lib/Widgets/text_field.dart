import 'package:flutter/material.dart';

// ignore: camel_case_types
class mytextfield extends StatelessWidget {
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
  final Controller;
  final String hintText;
  final bool obscureText;

  const mytextfield({
    super.key,
    // ignore: non_constant_identifier_names
    this.Controller,
    required this.hintText,
    required this.obscureText,
  });
  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: Controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          // labelText: 'Enter user Name or Email',
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 216, 216, 216)),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 143, 141, 141)),
            borderRadius: BorderRadius.circular(15.0),
          ),
          fillColor: Color(0xFFD9D9D9),
          filled: true,
          hintText: "    $hintText",
          hintStyle: const TextStyle(
            fontFamily: 'AirBnbBook',
            fontSize: 20,color: Color(0xFFABA9A9)),
        ),
        maxLines: 1,
        obscureText: obscureText,
      ),
    );
  }
}
