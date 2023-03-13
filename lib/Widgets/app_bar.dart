import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBar(){
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    actions: <Widget>[
      IconButton(onPressed: (){

      },
          icon: const Icon(Icons.arrow_circle_left_outlined,size: 30,color: Colors.black,)),
      IconButton(onPressed: (){},
          icon: const Icon(Icons.home_outlined,size: 30,color: Colors.black,))
    ],
    leading: IconButton(onPressed: (){},
        icon: Image.asset("assets/blueem.png")),
  );
}