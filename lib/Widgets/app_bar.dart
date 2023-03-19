import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../edit_profile.dart';

void check(BuildContext context, bool open) {
  if (open) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => const edit_profile()));
  } else {}
}

Widget appBar(BuildContext context, bool open) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    actions: <Widget>[
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
            size: 30,
            color: Colors.black,
          )),
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.home_outlined,
            size: 30,
            color: Colors.black,
          ))
    ],
    leading: IconButton(
        onPressed: () {
          check(context, open);
        },
        icon: Image.asset("assets/blueem.png")),
  );
}
