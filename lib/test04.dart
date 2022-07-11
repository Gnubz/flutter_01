import 'package:flutter/material.dart';
import 'package:flutter_01/dataclass/classcovid.dart';


class Test04 extends StatefulWidget {
  final Coviddata h2;
  const Test04({Key? key, required this.h2}) : super(key: key);

  @override
  State<Test04> createState() => _Test04State();
}

class _Test04State extends State<Test04> {
  late Coviddata m2;
  @override
  void initState() {

    super.initState();
    m2 = widget.h2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: SingleChildScrollView(
          child: Column(
        children: [
          Text(m2.newCase.toString()),
          Text(m2.totalCase.toString()),
          Text(m2.newCaseExcludeabroad.toString()),
          Text(m2.totalCaseExcludeabroad.toString())
        ],
      ))),
    );
  }
}
