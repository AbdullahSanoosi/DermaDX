import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'About-us.dart';
import 'camera_page.dart';
import 'home_page.dart';

// ignore: camel_case_types
class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _edit_profileState createState() => _edit_profileState();
}

// class UserManagement {
//   storeNewUser(user, context) async {
//     var firebaseUser = FirebaseAuth.instance.currentUser;
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(firebaseUser?.uid)
//         .set({'email': user.email, 'uid': user.uid})
//         .then((value) => Navigator.push(
//             context, MaterialPageRoute(builder: (context) => const CameraScreen())))
//         .catchError((e) {
//           print(e);
//         });
//   }
// }

// ignore: camel_case_types
class _edit_profileState extends State<edit_profile> {
  bool showPassword = false;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  void main() {
    // change string to print whatever you'd like!
    print(_name.text);
    print(_email.text);
  }

  Future storeNewUser() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .set({
          'name': _name.text,
          'email': _email.text,
          'Password': _password.text
        })
        .then((value) => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CameraScreen())))
        .catchError((e) {
          print(e);
        });
  }

  // Future adduser(String name, String email, String passweord) async {
  //   // var firba = await FirebaseFirestore.instance.currentUser();
  //   await FirebaseFirestore.instance.collection("user").doc();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 76, 91, 175),
          ),
          onPressed: () {},
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              // width: 100,
              // height: 100,
              child: Image.asset(
                'assets/icon.jpg',
                width: 40,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const Myaboutus()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
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
              buildTextField("Full Name", "Buddhima Kaushalya", false, _name),
              buildTextField(
                  "E-mail", "w18992@westminster.ac.lk", false, _email),
              buildTextField("Password", "********", true, _password),
              // buildTextField("Birthday", "01 April 1953", false),
              const SizedBox(
                height: 35,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
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
                                  const edit_profile()));
                        },
                        child: const Center(
                          child: Text("CANCEL",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Color.fromARGB(255, 236, 236, 236))),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 60)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 24, 58, 212)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        onPressed: () {
                          storeNewUser();
                          // main();
                        },
                        child: const Text(
                          "SAVE",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Color.fromARGB(255, 243, 240, 240)),
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
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginPage()));
                      },
                      child: const Center(
                        child: Text("SIGN OUT",
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 2.2,
                                color: Color.fromARGB(255, 236, 233, 233))),
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
      bool isPasswordTextField, TextEditingController cat) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: cat,
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
