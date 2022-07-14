import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Qrscan extends StatefulWidget {
  Qrscan({Key? key}) : super(key: key);

  @override
  State<Qrscan> createState() => _QrscanState();
}

class _QrscanState extends State<Qrscan> {
  Barcode? barcode;
  QRViewController? controller;
  final qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
     
    }
    controller!.resumeCamera(); setState(() {
        
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qrscan'),
      ),
      body: Stack(
        children: <Widget>[
          buildQrView(context),
          Positioned(bottom: 10, child: buildResult()),
          Positioned(
            top: 10,
            child: buildcot(),
          )
        ],
      ),
    );
  }

  Widget buildcot() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: (Icon(Icons.camera_alt_outlined)),
              onPressed: () {
                controller!.pauseCamera();
              }),
        ],
      );
  Widget buildResult() => Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white24),
        child: Text(
          barcode != null ? 'Result : ${barcode!.code}' : 'scan a code',
          maxLines: 3,
        ),
      );
  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: _onQrViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Theme.of(context).colorScheme.secondary,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );
  void _onQrViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}
