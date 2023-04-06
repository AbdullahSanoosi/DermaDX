import 'package:flutter/material.dart';
import 'package:skin_detection/doctor_list.dart';

import 'Widgets/app_bar.dart';

class result extends StatelessWidget {
  final String skin;

  const result({
    Key? key,
    required this.skin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(),
      ),
      // backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            //add title
            const SizedBox(height: 30.0),
            Text(
              skin,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            //add Image
            const SizedBox(height: 30.0),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(img(skin)), fit: BoxFit.cover),
                  border: Border.all(
                      color: const Color.fromARGB(255, 12, 12, 12), width: 4),
                  borderRadius: BorderRadius.circular(30)),
            ),
            //add details
            const SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                check(skin),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 25.0),
            ElevatedButton(
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 60)),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF1D26FA)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>  DoctorList()));
              },
              child: const Text(
                "Dermatologists",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'AirBnbBoldMid',
                    fontSize: 15),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

String check(String skin) {
  if (skin == "Acne") {
    return ("Acne is a skin condition caused by clogged hair follicles, resulting in pimples and other bumps on the skin. It can be caused by genetics, hormones, stress, and medication. Treatment involves medication, lifestyle changes, and skin care.");
  } else if (skin == "Monkeypox") {
    return ("Monkeypox is a viral disease that can be transmitted to humans from infected animals, causing fever, headache, muscle aches, and a rash. While it is generally self-limiting, severe cases can occur, and there is no specific treatment. Supportive care can help manage symptoms.");
  } else {
    return ("Chickenpox is a contagious viral infection causing a rash and blisters on the skin, and is spread through the air or contact. Symptoms include fever, rash, and headache, and it can lead to complications, especially in people with weakened immune systems. Vaccination is available to prevent chickenpox and its complications.");
  }
}

String img(String skin) {
  if (skin == "Acne") {
    return ('assets/acne-on-face.jpg');
  } else if (skin == "Monkeypox") {
    return ('assets/monkeypox.jpg');
  } else {
    return ('assets/chicken.jpg');
  }
}
