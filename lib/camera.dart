import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class camera extends StatefulWidget {
  camera({Key? key}) : super(key: key);

  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  File? image;
  double screen = 0;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 16),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
                child: Column(
              children: [
                image != null
                    ? Image.file(
                        image!,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      )
                    : const FlutterLogo(
                        size: 160,
                      ),
                const SizedBox(
                  height: 160,
                ),
                but01(),
              ],
            )),
          ),
        ),
      ),
    );
  }

  Future cameraPick() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print(" object: $e");
    }
  }

  Container but01() {
    return Container(
      child: ElevatedButton(
        onPressed: cameraPick,
        child: Text("ถ่ายภาพ"),
      ),
    );
  }
}
