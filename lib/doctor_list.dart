import 'package:flutter/material.dart';
import 'Widgets/list_element.dart';
import 'Widgets/app_bar.dart';
import 'doctorClass.dart';
//this class contains fields required for a doctor

class DoctorList extends StatelessWidget {
  DoctorList({Key? key}) : super(key: key);
  final List doctors = [Doctor("Dr. Sarah Fazy", "Colombo", "Dermatologists", "360wellnessbydrcherry.com", "doctor2.png", ["360 Wellness - Colombo"]),
    Doctor("Dr. Ahamed Uwysw", "Colombo", "Consultant Dermatologist", "NA", "doctorNoImg.png", ["Durdans Hospital - Colombo"]),
    Doctor("Dr. Janaka Akarawita", "Colombo", "Consultant Dermatologist", "NA", "doctor4.png", ["Nawaloka Hospital - Colombo", "Durdans Hospital - Colombo", "Lanka Hospital - Colombo", "Hemas Hospital - Thalawathugoda"]),
    Doctor("Dr. Fathima Hasmiya", "Colombo", "Dermatologists", "NA", "doctorNoImg.png", ["Hemas Hospital - Thalawathugoda"])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MyAppBar(),
        ),
      body:
      Column(
        children:[
          Container(
            padding: const EdgeInsets.only(left: 20,top: 10),
            alignment: Alignment.centerLeft,
            child: const Text("Recommended Dermatologist's",style: TextStyle(fontFamily: 'AirBnbBold',fontSize: 27,color: Colors.black,)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index){
                  return ListElement(
                      doctor: doctors[index]
                  );
                }
            ),
          ),
        ]
      )
    );
  }
}
