import 'package:flutter/material.dart';
import 'package:kantongku/presentation/pages/history_page.dart';
import 'package:kantongku/presentation/pages/home_page.dart';
import 'package:kantongku/presentation/pages/introduction_page.dart';
import 'package:kantongku/presentation/pages/signin_page.dart';
import 'package:kantongku/presentation/pages/pocket_page.dart';
import 'package:kantongku/presentation/pages/qr_scanner_page.dart';
import 'package:kantongku/presentation/pages/settings_page.dart';
import 'package:kantongku/presentation/pages/signup_page.dart';
import 'package:kantongku/presentation/pages/splash_page.dart';
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
      initialRoute: SplashPage.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case NavigationBarWidget.routeName:
            return MaterialPageRoute(
                builder: (_) => const NavigationBarWidget());
          case SplashPage.routeName:
            return MaterialPageRoute(builder: (_) => const SplashPage());
          case IntroductionPage.routeName:
            return MaterialPageRoute(builder: (_) => const IntroductionPage());
          case SigninPage.routeName:
            return MaterialPageRoute(builder: (_) => const SigninPage());
          case SignupPage.routeName:
            return MaterialPageRoute(builder: (_) => const SignupPage());
          case HomePage.routeName:
            return MaterialPageRoute(builder: (_) => const HomePage());
          case PocketPage.routeName:
            return MaterialPageRoute(builder: (_) => const PocketPage());
          case QRScannerPage.routeName:
            return MaterialPageRoute(builder: (_) => const QRScannerPage());
          case HistoryPage.routeName:
            return MaterialPageRoute(builder: (_) => const HistoryPage());
          case SettingsPage.routeName:
            return MaterialPageRoute(builder: (_) => const SettingsPage());
          default:
            return null;
        }
      },
    );
  }
}
