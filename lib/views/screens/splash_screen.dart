import 'package:flutter/material.dart';

import '../../utilities/constants.dart';
import '../../utilities/stock_colors.dart';
import '../../utilities/utility_functions.dart';
import './auth/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils.getScreenSize(context);
    return Scaffold(
      body: Container(
        color: SC.accent2,
        child: Hero(
          tag: 'logo',
          child: Center(
            child: Image.asset(
              C.logoLight,
              width: size.width * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
