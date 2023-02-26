import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState(){
    startCamera();
    super.initState();
  }

  @override
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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(onPressed: (){},
                       icon: const Icon(Icons.arrow_circle_left_outlined,size: 35,color: Colors.black,)),
            IconButton(onPressed: (){},
                icon: const Icon(Icons.home_outlined,size: 35,color: Colors.black,))
          ],
          leading: const ImageIcon(AssetImage("assets/blue_med.png")),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              const Positioned(
                left: 22,
                top: 100,
                width: 300,
                height: 60,

                child: Text('Scan Here',style: TextStyle(fontFamily: 'AirBnbBold',fontSize: 40,color: Colors.black,)),
              ),
              // CameraPreview(cameraController),
              ClipRect(
                  child: OverflowBox(
                    alignment: Alignment.center,
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Container(
                            width: 350,//width of camera preview
                            height: 600 / cameraController.value.aspectRatio,//height of camera preview
                            child: AspectRatio(
                              aspectRatio: cameraController.value.aspectRatio,
                              child: CameraPreview(cameraController),//Preview camera using camera controller
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
                child: button(Icons.photo_camera_outlined, Alignment.bottomCenter),
              )

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
            color: Colors.white,
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
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
