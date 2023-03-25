import 'package:flutter/material.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {

  //text editing controler
  final username = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(246, 255, 253, 253),
        body: SafeArea(
            child: Center(
          child: Column(children: [
            const SizedBox(height: 50),
            //logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Sign in ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),

            //welcomeback
            const SizedBox(height: 30),

            Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.pexels.com/photos/3777622/pexels-photo-3777622.jpeg?auto=compress&cs=tinysrgb&w=600",
                          ))),
                ),
              ],
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

            //singin button
            const SizedBox(height: 25.0),
            const mybutton(),
          ]),
        )));
  }
}

// ignore: camel_case_types
class mybutton extends StatelessWidget {
  const mybutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 35),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 22, 60, 213), borderRadius: BorderRadius.circular(10)),
      child: const Center(
        child: Text(
          "Sign in",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: Controller,
        decoration: InputDecoration(
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
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 43, 42, 42),
          ),
        ),
        maxLines: 1,
        obscureText: obscureText,
      ),
    );
  }
}

