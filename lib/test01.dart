import 'package:flutter/material.dart';
import 'package:flutter_01/menu.dart';

class Test01 extends StatefulWidget {
  const Test01({Key? key}) : super(key: key);

  @override
  State<Test01> createState() => _Test01State();
}

String username = "", password = "";

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
        zed();
      },
      icon: Icon(
        Icons.person_add_outlined,
      ),
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
          hintText: 'GnuB123',
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
          //errorText: 'Password is Wrong',
          prefixIcon: Icon(Icons.insert_chart),
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

  zed() {
    if (username == '11111' && password == '11111') {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => const Menu())));
    }

    setState(() {});
  }
}
