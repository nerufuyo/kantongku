import 'package:flutter/material.dart';
import 'package:kantongku/common/gap.dart';
import 'package:kantongku/presentation/pages/introduction_page.dart';
import 'package:kantongku/style/color.dart';
import 'package:kantongku/style/typography.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void navigateToHome(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, IntroductionPage.routeName);
    });
  }

  @override
  initState() {
    super.initState();
    navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: secondaryColor,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.account_balance_wallet_rounded,
                    size: 120,
                    color: textColor,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: secondaryColor,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.qr_code_rounded,
                      size: 40,
                      color: buttonColor,
                    ),
                  ),
                ),
              ],
            ),
            const VerticalGap10(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kantong',
                  style: poppinsH1.copyWith(color: textColor),
                ),
                Text(
                  'Ku',
                  style: poppinsH1.copyWith(color: buttonColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
