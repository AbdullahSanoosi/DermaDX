import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:skin_detection/image_helper.dart';
import 'dart:io';
import 'package:skin_detection/Widgets/app_bar.dart';
import 'package:skin_detection/result.dart';
import 'doctor_list.dart';

final imageHelper = ImageHelper();

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}



class _CameraScreenState extends State<CameraScreen> {

  File? _image;
  late List<CameraDescription> cameras;
  late CameraController cameraController;


  @override
  void initState(){
    startCamera();
    super.initState();
  }

  void startCamera() async{
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );
    await cameraController.initialize().then((value){
      if(!mounted){
        return;
      }
      setState(() {});//to refresh the widget
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose(){
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    if(cameraController.value.isInitialized){
      return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MyAppBar(),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              const Positioned(
                left: 22,
                top: 30,
                width: 300,
                height: 60,

                child: Text('Scan Here',style: TextStyle(fontFamily: 'AirBnbBold',fontSize: 30,color: Colors.black,)),
              ),
              const Positioned(
                left: 22,
                top: 80,
                width: 300,
                height: 30,

                child: Text('*Please capture Or upload the skin area to diagnose',style: TextStyle(fontFamily: 'AirBnbBook',fontSize: 10,color: Color(0xFF625F5F),)),
              ),
              // CameraPreview(cameraController),
              ClipRect(
                  child: OverflowBox(
                    alignment: const Alignment(0,-0.4),
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: SizedBox(
                            width: 350,//width of camera preview
                            height: 600 / cameraController.value.aspectRatio,//height of camera preview
                            child: AspectRatio(
                              aspectRatio: cameraController.value.aspectRatio,
                              child:  CameraPreview(cameraController),//Preview camera using camera controller
                            ))),
                  )),
              GestureDetector(
                onTap: (){
                  cameraController.takePicture().then((XFile? file){
                    if(mounted){
                      if(file != null){
                        print("Picture saved to ${file.path}");
                      }
                    }
                  });
                },
                child: button(Icons.camera_alt, const Alignment(-0.08,0.45)),
              ),
              Container(
                alignment: const Alignment(0,0.8),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>  const result(skin: "Acne")));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF141DEE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    fixedSize: const Size(204, 55),
                  ),
                  child: const Text('Start Diagnosing',style: TextStyle(fontSize: 20,fontFamily: 'AirBnbBold'),),

                ),
              ),
              Container(
                alignment: const Alignment(0,0.6),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final file = await imageHelper.pickImage();
                    if(file.isNotEmpty){
                      final croppedFile = await imageHelper.crop(
                          file: file,
                          cropStyle: CropStyle.rectangle,
                      );
                      if(croppedFile != null){
                        setState(() => _image = File(croppedFile.path));
                      }
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF6F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    fixedSize: const Size(300, 30),
                  ),
                  icon: const Icon(
                    Icons.photo,
                    size: 24.0,
                    color: Color(0xFF3F3D3D),
                  ),
                  label: const Text('select from photos ',style: TextStyle(fontSize: 20,fontFamily: 'AirBnbBold',color: Color(0xFF3F3D3D)),),

                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 90.0,vertical: 300),
              //   child: Container(
              //     padding: const EdgeInsets.all(20),
              //     decoration: BoxDecoration(
              //         color: const Color(0xFF194660),
              //         borderRadius: BorderRadius.circular(32)
              //     ),
              //     child: const Center(
              //       child: Text('Create Account',
              //         style: TextStyle(
              //             color: Color(0xFFFFFFFF),
              //             fontFamily: 'AirBnbExBold',
              //             fontSize: 15),),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );
    }else{
      return const SizedBox();
    }
  }
  Widget button(IconData icon, Alignment alignment){
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(
            left: 20,
            bottom: 20
        ),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF141DEE),
            boxShadow:[
              BoxShadow(
                color: Colors.black26,
                offset: Offset(2, 2),
                blurRadius: 10,
              )
            ]
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
