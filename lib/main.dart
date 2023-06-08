import 'package:flutter/material.dart';
import 'package:kantongku/presentation/pages/home_page.dart';
import 'package:kantongku/presentation/widgets/navbar_widget.dart';
import 'package:kantongku/style/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: primaryColor,
      ),
      initialRoute: NavigationBarWidget.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case NavigationBarWidget.routeName:
            return MaterialPageRoute(
                builder: (_) => const NavigationBarWidget());
          case HomePage.routeName:
            return MaterialPageRoute(builder: (_) => const HomePage());
          default:
            return null;
        }
      },
    );
  }
}
