import 'package:flutter/material.dart';
import 'package:intertoon/main.dart';
import 'package:intertoon/pages/Category/CategoryPage.dart';
import 'package:intertoon/pages/Home/Home.dart';
import 'package:intertoon/pages/Profile/ProfilePage.dart';
import 'package:intertoon/pages/Search/SearchPage.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedindex = 0;
  void _navigationBottomBar(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final List<Widget> _pages = [
      const HomePage(),
      const Category(),
      const Search(),
      const Profile()
    ];
    return Scaffold(
      backgroundColor: Color(0xFFE4E4E4),
      body: _pages[_selectedindex],
      bottomNavigationBar: SizedBox(
        height: height * 0.07,
        width: width,
        child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 16,
            backgroundColor: Color(0xFFE4E4E4),
            currentIndex: _selectedindex,
            onTap: _navigationBottomBar,
            selectedItemColor: Color(0xFF04ABBD),
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_sharp), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "")
            ]),
      ),
    );
  }
}
