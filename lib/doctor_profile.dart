import 'package:flutter/material.dart';
import 'Widgets/app_bar.dart';
import 'doctorClass.dart';

class DoctorProfile extends StatelessWidget {
  final Doctor doctor;

  const DoctorProfile({
    Key? key,
    required this.doctor,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(),
      ),
      body: Column(
          children:[
            Container(
              padding: const EdgeInsets.only(left: 20,top: 10),
              alignment: Alignment.centerLeft,
              child: const Text("Doctor’s Profile",style: TextStyle(fontFamily: 'AirBnbBold',fontSize: 30,color: Colors.black,)),
            ),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 470,
                  decoration: BoxDecoration(
                      color: Color(0xFFF7F8FA),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFABA9A9),
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(
                            2,
                            2,
                          ),
                        ),
                      ]
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: 140,
                          height: 140,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image.asset(
                              'assets/${doctor.image}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          child: Text(
                            "DR. ${doctor.name}".toUpperCase(),
                            style: const TextStyle (
                              fontFamily: 'AirBnbBold',
                              fontSize: 15,
                              color: Color(0xff1e1e1e),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: const SizedBox(
                          child: Text(
                            "MBBS",
                            style: TextStyle (
                              fontFamily: 'AirBnbBook',
                              fontSize: 15,
                              color: Color(0xff1C25F3),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          child: Text(
                            "${doctor.title}",
                            style: const TextStyle (
                              fontFamily: 'AirBnBLight',
                              fontSize: 12,
                              color: Color(0xff999999),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          child: Text(
                            "Available Hospitals".toUpperCase(),
                            style: const TextStyle (
                              fontFamily: 'AirBnbBold',
                              fontSize: 13,
                              color: Color(0xff1e1e1e),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: doctor.hospitals.map((element){
                          return Text(
                            element.toUpperCase(),
                            style: const TextStyle (
                              fontFamily: 'AirBnbBook',
                              fontSize: 11,
                              color: Color(0xff1e1e1e),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'EMAIL :',
                              style: TextStyle (
                                fontFamily: 'AirBnbBold',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            const TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: "${doctor.email}",
                              style: const TextStyle (
                                fontFamily: 'AirBnbBold',
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff141dee),
                              ),
                            ),
                          ],
                        ),
                      )


                    ],
                  ),
                )
            ),
            Container(
              alignment: const Alignment(0,0.8),
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF141DEE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  fixedSize: const Size(204, 55),
                ),
                child: const Text('Set Reminder',style: TextStyle(fontSize: 20,fontFamily: 'AirBnbBold'),),

              ),
            ),
          ]
      )
    );
  }
}
