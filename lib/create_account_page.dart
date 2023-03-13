import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection/Widgets/app_bar.dart';
// ignore: camel_case_types
class CreateAccount extends StatefulWidget {
  final VoidCallback showLoginPage;
  const CreateAccount({
    Key? key,
    required this.showLoginPage})
      : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}
class _CreateAccountState extends State<CreateAccount>{
  //text editing controler
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _repeatPassword = TextEditingController();

  //Creates a user account
  Future signUp() async {
    //authenticating the user
    if(passwordConfirmed()){
      //create a user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(),
          password: _password.text.trim());

      //calling addUserDetails and adding user information
      addUserDetails(
          _firstName.text.trim(),
          _lastName.text.trim(),
          _email.text.trim()
      );
    }
  }


  //add user's details
  Future addUserDetails(String firstName,String lastName, String email) async {
    final json = {
      'first name' : firstName,
      'last name' : lastName,
      'email' : email,
    };
    await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).set(json);
  }

  //check if the password is confirmed
  bool passwordConfirmed(){
    if(_repeatPassword.text.trim() == _password.text.trim()){
      return true;
    }else {
      return false;
    }
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
                  const Icon(
                    Icons.account_circle_outlined,
                    color: Color(0xFFABA9A9),
                    size: 300,
                  ),
                  //enter email
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: SizedBox(
                          width: 150,
                          child: TextField(

                            controller: _firstName,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(13),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0x6FDCD6D6)),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              hintText: 'first name',
                              hintStyle: const TextStyle(
                                  fontFamily: 'AirBnbBook',
                                  fontSize: 20,color: Color(0xFFABA9A9)),
                              fillColor: Color(0xFFD9D9D9),
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: SizedBox(
                          width: 150,
                          child: TextField(
                            controller: _lastName,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(13),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0x6FDCD6D6)),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              hintText: 'last name',
                              hintStyle: const TextStyle(
                                  fontFamily: 'AirBnbBook',
                                  fontSize: 20,color: Color(0xFFABA9A9)),
                              fillColor: Color(0xFFD9D9D9),
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(13),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x6FDCD6D6)),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        hintText: 'email',
                        hintStyle: const TextStyle(
                            fontFamily: 'AirBnbBook',
                            fontSize: 20,color: Color(0xFFABA9A9)),
                        fillColor: Color(0xFFD9D9D9),
                        filled: true,
                      ),
                    ),
                  ),

                  //enter pasword
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextField(
                      controller: _password,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(13),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x6FDCD6D6)),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        hintText: 'password',
                        hintStyle: const TextStyle(
                            fontFamily: 'AirBnbBook',
                            fontSize: 20,color: Color(0xFFABA9A9)),
                        fillColor: Color(0xFFD9D9D9),
                        filled: true,
                      ),
                      obscureText: true,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextField(
                      controller: _repeatPassword,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(13),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x6FDCD6D6)),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        hintText: 'repeat password',
                        hintStyle: const TextStyle(
                            fontFamily: 'AirBnbBook',
                            fontSize: 20,color: Color(0xFFABA9A9)),
                        fillColor: Color(0xFFD9D9D9),
                        filled: true,
                      ),
                      obscureText: true,
                    ),
                  ),

                  //forgotpass
                  const SizedBox(height: 10),

                  //singin button
                  const SizedBox(height: 25.0),
                  ElevatedButton(
                      onPressed: (){
                        signUp();
                      },
                      child: const Text("Create Account")),
                  const SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account? ',
                        style: TextStyle(
                            color: Color(0xFF989797),
                            fontFamily: 'AirBnbBoldMid',
                            fontSize: 15),
                      ),
                      GestureDetector(
                          onTap: widget.showLoginPage,
                          child: const Text(
                            'Sign in',
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
