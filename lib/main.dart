import 'package:buyers/pages/favorite_page.dart';
import 'package:buyers/pages/home_page.dart';
import 'package:buyers/pages/profile_page.dart';
import 'package:buyers/pages/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BuyerApp());
}

class BuyerApp extends StatelessWidget {
  const BuyerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/favorite_page': (context) => FavoritePage(),
        'home_page': (context) => HomePage(),
        '/profile_page': (context) => ProfilePage(),
        '/searcj_page': (context) => SearchPage(),
      },
    );
  }
}
