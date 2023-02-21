import 'package:flutter/material.dart';

class Myaboutus extends StatelessWidget {
  const Myaboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            //add icon
            const SizedBox(height: 30.0),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/icon.jpg',
                      width: 50,
                    ),
                  ],
                )),
            //add title
            const SizedBox(height: 30.0),
            const Text(
              'ABOUT US',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            //add logo
            const SizedBox(height: 30.0),
            Image.asset(
              'assets/logo.jpg',
              width: 200,
            ),
            //version
            //add title
            const SizedBox(height: 15.0),
            const Text(
              'VERSION 1.0',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            //add details
            const SizedBox(height: 30.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                'We made this application for our SDGP project. It helps people to find their skin diseases.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            //developer names
            //add title
            const SizedBox(height: 30.0),
            const Text(
              'DEVELOPED BY',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            //names
            const SizedBox(height: 30.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.0),
              child: Text(
                'Abdulla Sanoosi(w1899294)  Buddima Kawushalya(w1899294)  Gishya Mendis(189929)              Ashail Hearath(1899294)  Induranga Kawishwara(1899298)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
