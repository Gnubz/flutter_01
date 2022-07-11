import 'package:flutter/material.dart';
import 'package:flutter_01/test02.dart';
import 'package:flutter_01/test03.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<Widget> listwidget = [const Test02(), const Test03()];

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
        label: 'Page 2',
        backgroundColor: Colors.pink,);
  }
  BottomNavigationBarItem bottomNavigationBarItem2() {
    return const BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Page 3',
        backgroundColor: Color.fromARGB(255, 240, 236, 236),);
        }

  BottomNavigationBar bottom01() {
    return BottomNavigationBar(
      items: [bottomNavigationBarItem(), bottomNavigationBarItem2()],
      currentIndex: index,
      selectedItemColor: Colors.amber[500],
      backgroundColor: const Color.fromARGB(255, 54, 244, 155),
      onTap: onitem,
      
    );
  }
}
