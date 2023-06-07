import 'package:flutter/material.dart';
import 'package:kantongku/style/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: primaryColor,
        body: const Center(
          child: Text('Home Page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: buttonColor,
          child: const Icon(Icons.qr_code_2_rounded, color: text2Color,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(
               top: BorderSide(
                 color: Colors.grey,
                 width: 0.5,
               ),
               left: BorderSide(
                 color: Colors.grey,
                 width: 0.5,
               ),
                right: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
               bottom: BorderSide(
                 color: Colors.grey,
                 width: 0.5,
               ),
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              currentIndex: 0,
              backgroundColor: primaryColor,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}