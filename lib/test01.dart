import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:flutter_01/menu.dart';

import 'package:http/http.dart' as http;

class Test01 extends StatefulWidget {
  const Test01({Key? key}) : super(key: key);

  @override
  State<Test01> createState() => _Test01State();
}

String 
 username= "", password = "";

class _Test01State extends State<Test01> {
  final userController = TextEditingController();
  bool isPasswordsVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),

      decoration: const BoxDecoration(
          gradient: RadialGradient(
              center: Alignment(0, -0.33),
              radius: 2,
              colors: <Color>[
            Color.fromARGB(255, 172, 250, 148),
            Color.fromARGB(255, 46, 122, 254)
          ])),
      child: Scaffold(
        //backgroundColor: Color.fromARGB(255, 184, 241, 235),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                image01(),
                SizedBox(height: 10, width: 20),
                /* text01(),
                text02(),*/
                textfield1(),
                SizedBox(height: 10, width: 20),
                textfield2(),
                SizedBox(height: 10, width: 20),
                button1()
              ],
            ),
          ),
        )),
      ),
    );
  }

  ElevatedButton button1() {
    return ElevatedButton.icon(
      onPressed: () {
        readdata();
      },
      icon: Icon(Icons.login_outlined),
      label: Text('LOGIN'),
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10)),
    );
  }
  //   return ElevatedButton(
  //       // icon: Icon(Icons.abc,size: 32,),
  //       onPressed: () {
  //         zed();111
  //       },
  //       child: const Text('LOGIN'));
  // }

  TextField textfield1() {
    return TextField(
      controller: userController,
      onChanged: (value) => username = value.trim(),
      obscureText: false,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(16)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          border: OutlineInputBorder(),
          labelText: 'Username',
          hintText: 'asd8473',
          prefixIcon: Icon(Icons.people),
          suffixIcon: IconButton(
            onPressed: () => userController.clear(),
            icon: Icon(Icons.close),
          )),
    );
  }

  TextField textfield2() {
    return TextField(
      onChanged: (value) => password = value.trim(),
      obscureText: isPasswordsVisible,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(16)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          border: OutlineInputBorder(),
          labelText: 'Password',
          // errorText: 'Password is Wrong',
          //prefixIcon: Icon(Icons.account_tree),
          suffixIcon: IconButton(
              icon: isPasswordsVisible
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              onPressed: () => setState(() {
                    isPasswordsVisible = !isPasswordsVisible;
                  }))),
    );
  }

  /*Text text02() {
    return Text(
      password,
      style:
          const TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 0, 0)),
    );
  }

  Text text01() {
    return Text(
      username,
      style:
          const TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 0, 0)),
    );
  }*/

  Image image01() {
    return Image.asset('assets/logo.png');
  }

   readdata() async {
    String url = 'http://192.168.1.236/webapi_jwt/api/token/get?zclient=910&username=SUMPHAN&password=51522515';
    final response1 = await http.get(Uri.parse(url));
    var  splitted = response1.body.toString().split(" \" ");
    final response = await http.get(
  Uri.parse('http://192.168.1.236/webapi_jwt/api/Zmmim03/Pallet_Chk?zclient=510&palletno=Y220000003&zoption=S'),
  headers:{
     HttpHeaders.authorizationHeader: splitted.toString(),
  }
  );
  print(splitted.toString());
  print(response.body.toString());

  }
}
