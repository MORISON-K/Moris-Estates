import 'package:buyers/pages/favorite_page.dart';
import 'package:buyers/pages/profile_page.dart';
import 'package:buyers/pages/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  void _navigationBottomBar(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  final List _pages = [
    HomeContent(),
    SearchPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Welcome Moris"),
      //   leading: Icon(Icons.face),
      //   backgroundColor: Colors.grey,
      // ),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blueGrey,

        currentIndex: _selectedPage,
        onTap: _navigationBottomBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'profile'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Home content will be here")),
    );
  }
}