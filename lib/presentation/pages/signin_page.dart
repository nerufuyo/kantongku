import 'package:flutter/material.dart';
import 'package:kantongku/common/gap.dart';
import 'package:kantongku/presentation/pages/signup_page.dart';
import 'package:kantongku/presentation/widgets/navbar_widget.dart';
import 'package:kantongku/style/color.dart';
import 'package:kantongku/style/typography.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});
  static const routeName = '/signin-page';

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              'Sign In',
              style: poppinsH1.copyWith(color: buttonColor, fontSize: 36),
            ),
            Text(
              'Sign in to continue to Kantongku',
              style: poppinsBody1.copyWith(color: textColor),
            ),
            const VerticalGap20(),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'E-mail',
                hintStyle:
                    poppinsBody1.copyWith(color: textColor.withOpacity(.5)),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: textColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: buttonColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              style: poppinsBody1.copyWith(color: textColor),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!value.contains('@')) {
                  return 'Please enter a valid email address';
                } else if (!value.contains('.')) {
                  return 'Please enter a valid email address';
                } else if (value.contains(' ')) {
                  return 'Please enter a valid email address';
                } else if (value.contains('..')) {
                  return 'Please enter a valid email address';
                } else if (value.contains('@.')) {
                  return 'Please enter a valid email address';
                } else if (value.contains('.@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const VerticalGap10(),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle:
                    poppinsBody1.copyWith(color: textColor.withOpacity(.5)),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _isPasswordHidden = !_isPasswordHidden;
                    });
                  },
                  child: Icon(
                    _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                    color: textColor.withOpacity(.5),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: textColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: buttonColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              style: poppinsBody1.copyWith(color: textColor),
              obscureText: _isPasswordHidden ? true : false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                } else if (value.contains(' ')) {
                  return 'Password must not contain spaces';
                } else if (value.contains('..')) {
                  return 'Password must not contain double dots';
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const VerticalGap20(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, NavigationBarWidget.routeName);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: poppinsH4.copyWith(color: text2Color),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignupPage.routeName);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: buttonColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
