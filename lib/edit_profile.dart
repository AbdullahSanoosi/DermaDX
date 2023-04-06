import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'About_us.dart';
import 'Widgets/app_bar.dart';
import 'home_page.dart';

// ignore: camel_case_types
class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _edit_profileState createState() => _edit_profileState();
}

// ignore: camel_case_types
class _edit_profileState extends State<edit_profile> {
  bool showPassword = false;

  //Get the current user's data
  final documentRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid);

  //controllers
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();

  Future updateData() async {
    documentRef.update({
      'first name': _firstName.text.trim(),
      'last name': _lastName.text.trim(),
      'email': _email.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(),
      ),
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   elevation: 1,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       color: Color.fromARGB(255, 76, 91, 175),
      //     ),
      //     onPressed: () {},
      //   ),
      //   actions: [
      //     GestureDetector(
      //       child: Container(
      //         margin: const EdgeInsets.symmetric(horizontal: 10),
      //         // width: 100,
      //         // height: 100,
      //         child: Image.asset(
      //           'assets/icon.jpg',
      //           width: 40,
      //         ),
      //       ),
      //       onTap: () {
      //         Navigator.of(context).push(MaterialPageRoute(
      //             builder: (BuildContext context) => const Myaboutus()));
      //       },
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: ListView(
            children: [
              const SizedBox(height: 15.0),
              const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
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
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: const Color.fromARGB(255, 34, 57, 187),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 22, 22, 22),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              buildTextField("First Name", "Buddhima", false, _firstName),
              buildTextField("Last Name", "Kaushalya", false, _lastName),
              buildTextField(
                  "E-mail", "w18992@westminster.ac.lk", false, _email),
              buildTextField("Password", "********", true, _password),
              // buildTextField("Birthday", "01 April 1953", false),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 32, 45, 221)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 40)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LoginPage()));
                        },
                        child: const Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AirBnbBoldMid',
                                fontSize: 15),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 60)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF1D26FA)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        onPressed: updateData,
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'AirBnbBoldMid',
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 233, 54, 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginPage()));
                      },
                      child: const Center(
                        child: Text(
                          "SIGN OUT",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'AirBnbBoldMid',
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(213, 129, 125, 125),
            )),
      ),
    );
  }
}
