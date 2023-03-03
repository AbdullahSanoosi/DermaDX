import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  const mybutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 130),
      decoration: BoxDecoration(
          color: Color(0xFF141DEE), borderRadius: BorderRadius.circular(10)),
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
