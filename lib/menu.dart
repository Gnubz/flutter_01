import 'package:flutter/material.dart';
import 'package:flutter_01/camera.dart';
import 'package:flutter_01/qrg.dart';
import 'package:flutter_01/qrscan.dart';
import 'package:flutter_01/test02.dart';

//test 010101//
class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}



class _MenuState extends State<Menu> {
  List<Widget> listwidget = [const Test02(),  Qr(),  Qrscan() , camera()];

  int index = 0;

  void onitem(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listwidget.elementAt(index),
      bottomNavigationBar: bottom01(),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.local_hospital_outlined),
      label: 'Covid',
      backgroundColor: Colors.pink,
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem2() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.youtube_searched_for),
      label: 'Qr gen',
      backgroundColor: Color.fromARGB(255, 240, 236, 236),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem3() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt),
      label: 'Qr Scan',
      backgroundColor: Color.fromARGB(255, 228, 66, 66),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem4() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt),
      label: 'Qr Scan',
      backgroundColor: Color.fromARGB(255, 0, 207, 253),
    );
  }

  BottomNavigationBar bottom01() {
    return BottomNavigationBar(
      items: [
        bottomNavigationBarItem(),
        bottomNavigationBarItem2(),
        bottomNavigationBarItem3(),
        bottomNavigationBarItem4()
      ],
      currentIndex: index,
      selectedItemColor: Colors.amber[500],
      backgroundColor: const Color.fromARGB(255, 54, 244, 155),
      onTap: onitem,
    );
  }
}
