import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/pages/home_page.dart';
import 'package:climblog_mobile/pages/routes_page.dart';
import 'package:climblog_mobile/pages/trening_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int _selectedIndex = 0;
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  static final List<Widget> _pages = <Widget>[
    HomePage(),
    RoutesPage(),
    TreningPage(),

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Image.asset("./assets/Branding.png", height: MediaQuery.of(context).size.height / 18,),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService().logout();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, "/login");
              }
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home' 
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.terrain),
            label: 'Routes' 
            ),
             BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Trening' 
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xff27688d), 
        ),
    );
  }
}
