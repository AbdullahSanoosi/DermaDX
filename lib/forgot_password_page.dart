import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection/Widgets/app_bar.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _email = TextEditingController();

  Future passwordReset() async {
    try{
      await FirebaseAuth.instance.
      sendPasswordResetEmail(email: _email.text.trim());
        showDialog(context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Password resent link successfully sent to your email!"),
              );
            });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Text('Enter your email and we will send you a password reset link',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'AirBnbBoldMid',
                    fontSize: 20),),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
              controller: _email,
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
              MaterialButton(
                  onPressed: passwordReset,
                  color: const Color(0xFF1D26FA),
                  child: const Text('Reset Password',style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'AirBnbBoldMid',
                      fontSize: 15),),
                  )
          ]
      )
    );
  }
}
