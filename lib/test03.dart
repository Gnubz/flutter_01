import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Test03 extends StatefulWidget {
  const Test03({Key? key}) : super(key: key);

  @override
  State<Test03> createState() => _Test03State();
}

String str02 = "Hello Dart!";

class _Test03State extends State<Test03> {
  double screen = 0;
  Future read() async {
    String str = 'https://covid19.ddc.moph.go.th/api/Cases/today-cases-all';
    Response response = await Dio().get(str);
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return SafeArea(
        child: FutureBuilder(
      future: read(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: SafeArea(
                child: Center(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 16),
                      width: screen * 0.9,
                      height: screen * 0.9,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 67, 243, 2)),
                      child: Text(
                        snapshot.data[0]["total_case"].toString(),
                        style: TextStyle(
                            color: Colors.cyanAccent.withOpacity(0.9),
                            fontSize: 20),
                      ))
                ],
              )),
            )),
          );
        } else {
          return Center(
            child:
                Column(children: const <Widget>[CircularProgressIndicator()]),
          );
        }
      },
    ));
  }
}
