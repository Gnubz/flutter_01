import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr extends StatefulWidget {
  Qr({Key? key}) : super(key: key);

  @override
  State<Qr> createState() => _QrState();
}

class _QrState extends State<Qr> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: controller.text,
              version: QrVersions.auto,
              size: 200.0,
            ),
            buildtextfild(context)
          ],
        ),
      ),
    );
  }

  TextField buildtextfild(BuildContext context) => TextField(
        controller: controller,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'QR',
          labelStyle: TextStyle(color: Colors.white),
          hintText: 'QR',
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 240, 2, 2)),
          ),
          suffix: IconButton(
            color: Theme.of(context).colorScheme.secondary,
            icon: Icon(Icons.back_hand),
            onPressed: () {
              scan();
            },
          ),
        ),
      );
  scan() {
    setState(() {});
  }
}
