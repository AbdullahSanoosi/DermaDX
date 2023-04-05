import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection/edit_profile.dart';

import '../camera_page.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 30,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CameraScreen()),
              );
            },
            icon: const Icon(
              Icons.home_outlined,
              size: 30,
              color: Colors.black,
            ))
      ],
      leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const edit_profile()),
            );
          },
          icon: Image.asset("assets/blueem.png")),
    );
    ;
  }
}
