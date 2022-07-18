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
          Text("จังหวัด :=> ${m2.province}"),
          Text("ปี-เดือน-วัน :=> ${m2.txnDate}"),
          Text("เคสใหม่ :=> ${m2.newCase}"),
          Text("เคสทั้งหมด :=> ${m2.totalCase}"),
          Text("ตายเพิ่ม :=> ${m2.newDeath}"),
          Text("ตายทั้งหมด :=> ${m2.totalDeath}"),
          Text("อัพเดตเมื่อ:=> ${m2.updateDate}")
        ],
      ))),
    );
  }
}
