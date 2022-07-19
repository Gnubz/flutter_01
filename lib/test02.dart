
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_01/dataclass/classcovid.dart';
import 'package:flutter_01/test04.dart';

class Test02 extends StatefulWidget {
  const Test02({Key? key}) : super(key: key);

  @override
  State<Test02> createState() => _Test02State();
}

class _Test02State extends State<Test02> {
  List<Coviddata> b = [];
  int a = 1;
  List<Widget> widgets = [];
  @override
  void initState() {
    super.initState();
    readdata();
  }

  Widget crtwidget(Coviddata h2, int index01) => GestureDetector(
        child: Card(
          child: Center(
              child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Test04(
                        h2: b[index01],
                      ),
                    ),
                  );
                },
                leading: const Icon(Icons.man_sharp),
                title: Text(
                  h2.txnDate.toString(),
                  style: TextStyle(
                      color:
                          const Color.fromARGB(255, 5, 69, 2).withOpacity(0.9),
                      fontSize: 20),
                ),
                tileColor: const Color.fromARGB(175, 187, 236, 179),
                subtitle: Text(
                  h2.province.toString(),
                  style: TextStyle(
                      color:
                          const Color.fromARGB(140, 207, 6, 6).withOpacity(0.9),
                      fontSize: 20),
                ),
              )
            ],
          )),
        ),
      );

  Future<void> readdata() async {
    String url =
        'http://192.168.1.236/webapi_jwt/api/token';
    Response response = await Dio().get(url+"/get?zclient=910&username=SUMPHAN&password=51522515");
    int index01 = 0;
    print(response);
    // for (var sna in response.data) {
    //   print(sna);
    //   Map<String, dynamic> map = sna;
    //   Coviddata model = Coviddata.fromJson(map);

    //   setState(() {
    //     b.add(model);
    //     widgets.add(crtwidget(model, index01));
    //   });
    //   index01++;
    // }
  }

  // Future<Void> refresh() {
  //   return Future.delayed(Duration(milliseconds: 400));

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment(0, -0.33),
                  radius: 2,
                  colors: <Color>[
                Color.fromARGB(255, 172, 250, 148),
                Color.fromARGB(255, 46, 122, 254)
              ])),
          child: widgets.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  child: ListView(
                    children: widgets,
                  ),
                  onRefresh: () async {
                    return Future<void>.delayed(Duration(seconds: 3));
                  },
                  strokeWidth: 2,
                  // color: Colors.redAccent,
                  // backgroundColor: Colors.yellow,
                  displacement: 200,
                  edgeOffset: 20,
                )
          // : ListView(
          //     children: widgets,
          //   ),
          ),
    );
  }
}
