import 'package:flutter/material.dart';
import 'package:flutter_01/menu.dart';
import 'package:flutter_01/test01.dart';
import 'package:flutter_01/test02.dart';
import 'package:flutter_01/test03.dart';

//use to link --//

final Map<String, WidgetBuilder> router01 = {
  '/Test01': (BuildContext context) => const Test01(),
  '/Test02': (BuildContext context) => const Test02(),
  '/Test03': (BuildContext context) => const Test03(),
  '/menu': (BuildContext context) => const Menu()
};
