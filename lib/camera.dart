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

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(top: 16),
      child: ElevatedButton(
        onPressed: cameraPick,
        child: Text("ถ่ายภาพ"),
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
}
