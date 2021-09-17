import 'package:flutter/material.dart';
import 'Screens/Splash_Screen.dart';

void main() {
  runApp(CryptoC());
}

class CryptoC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // 01. Application theme is Created.
        primaryColor: Color(0xFF1B2525),
      ),
      home: SplashScreen(), // 02. Navigated Towards Application SplashScreen.
    );
  }
}
