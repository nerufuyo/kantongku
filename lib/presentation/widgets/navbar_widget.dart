import 'package:flutter/material.dart';
import 'package:kantongku/presentation/pages/home_page.dart';
import 'package:kantongku/style/color.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});
  static const routeName = '/navigation-bar';

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int _selectedIndex = 0;
  final List widgetIcons = const [
    Icons.home,
    Icons.wallet_rounded,
    Icons.history,
    Icons.settings,
  ];
  final List widgetTitles = const [
    'Home',
    'Pocket',
    'History',
    'Settings',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            HomePage(),
            Center(
              child: Text('Transaction'),
            ),
            Center(
              child: Text('History'),
            ),
            Center(
              child: Text('Settings'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: buttonColor,
          elevation: 0,
          child: const Icon(
            Icons.qr_code_scanner_rounded,
            color: text2Color,
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomAppBar(
          color: primaryColor,
          elevation: 10,
          notchMargin: 8,
          shadowColor: textColor,
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 66,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              _onItemTapped(0);
                            },
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            icon: Icon(
                              widgetIcons[0],
                              color:
                                  _selectedIndex == 0 ? buttonColor : textColor,
                            ),
                          ),
                          Text(
                            widgetTitles[0],
                            style: TextStyle(
                              color:
                                  _selectedIndex == 0 ? buttonColor : textColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              _onItemTapped(1);
                            },
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            icon: Icon(
                              widgetIcons[1],
                              color:
                                  _selectedIndex == 1 ? buttonColor : textColor,
                            ),
                          ),
                          Text(
                            widgetTitles[1],
                            style: TextStyle(
                              color:
                                  _selectedIndex == 1 ? buttonColor : textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              _onItemTapped(2);
                            },
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            icon: Icon(
                              widgetIcons[2],
                              color:
                                  _selectedIndex == 2 ? buttonColor : textColor,
                            ),
                          ),
                          Text(
                            widgetTitles[2],
                            style: TextStyle(
                              color:
                                  _selectedIndex == 2 ? buttonColor : textColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              _onItemTapped(3);
                            },
                            constraints: const BoxConstraints(
                              minWidth: 20,
                              minHeight: 20,
                            ),
                            icon: Icon(
                              widgetIcons[3],
                              color:
                                  _selectedIndex == 3 ? buttonColor : textColor,
                            ),
                          ),
                          Text(
                            widgetTitles[3],
                            style: TextStyle(
                              color:
                                  _selectedIndex == 3 ? buttonColor : textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
