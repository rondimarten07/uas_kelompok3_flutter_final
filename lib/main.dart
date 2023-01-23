import 'package:flutter/material.dart';
import 'package:uas_kelompok3/add.dart';
import 'package:uas_kelompok3/detail.dart';
import 'package:uas_kelompok3/edit.dart';
import 'package:uas_kelompok3/login.dart';
import 'package:uas_kelompok3/menu/about_menu.dart';
import 'package:uas_kelompok3/menu_bm.dart';
import 'package:uas_kelompok3/read.dart';
import 'package:uas_kelompok3/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/add': (context) => AddData(),
        '/read': (context) => Read(),
        '/menu': (context) => Menu(),
        '/detail': (context) => Detail(),
        '/edit': (context) => Edit(),
        '/about': (context) => AboutMenu(),
      },
    );
  }
}
