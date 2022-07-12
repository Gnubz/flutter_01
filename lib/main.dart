import 'package:flutter/material.dart';
import 'package:flutter_01/router.dart';


String router = '/qrscan';
Future<void>  main() async{
  runApp(const MyApp());
  
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    routes: router01,
    initialRoute: router,);
  }
}