import 'package:flutter/material.dart';

import 'Widgets/app_bar.dart';

class Myaboutus extends StatelessWidget {
  const Myaboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(),
      ),
      backgroundColor: Colors.white,
      body: ListView(children: [
        Center(
          child: Column(
            children: [
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
                  textAlign: TextAlign.justify,
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                child: Text(
                  'Abdulla Sanoosi(w19128032)\nBuddima Kawushalya(w1899294)\nGishya Mendis(w1898900)\nAshail Hearath(w1912880)\nInduranga Kawishwara(w1913278)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
