import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection/doctor_list.dart';
import 'package:skin_detection/doctor_profile.dart';
import 'package:skin_detection/doctorClass.dart';

class ListElement extends StatelessWidget {

  final Doctor doctor;

  const ListElement({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DoctorProfile(doctor: doctor,)),
        );
      },
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 105,
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
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
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Align(
                    child: SizedBox(
                      width: 100,
                      height: 105,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only (
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: Image.asset(
                          'assets/${doctor.image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 130,
                  top: 10,
                  child: Align(
                    child: SizedBox(
                      width: 250,
                      height: 18,
                      child: Text(
                        "DR. ${doctor.name}".toUpperCase(),
                        style: const TextStyle (
                          fontFamily: 'AirBnbBold',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: Color(0xff1e1e1e),
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 130,
                  top: 28,
                  child: Align(
                    child: SizedBox(
                      width: 250,
                      height: 18,
                      child: Text(
                        "MBBS",
                        style: TextStyle (
                          fontFamily: 'AirBnbBook',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: Color(0xff1C25F3),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 130,
                  top: 60,
                  child: Align(
                    child: SizedBox(
                      width: 250,
                      height: 18,
                      child: Text(
                        "${doctor.title}",
                        style: const TextStyle (
                          fontFamily: 'AirBnBLight',
                          fontSize: 12,
                          height: 1.2,
                          color: Color(0xff999999),
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 130,
                  top: 80,
                  child: Align(
                    child: SizedBox(
                      width: 250,
                      height: 18,
                      child: Text(
                        "${doctor.adress}",
                        style: const TextStyle (
                          fontFamily: 'AirBnbBook',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: Color(0xa3141dee),
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          )
      ),
    );
  }
}
