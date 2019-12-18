import 'package:flutter/material.dart';

import 'constants/strings.dart';
import 'screens/splash.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.AppName,
      theme: ThemeData(
        fontFamily: 'IranSans',
        backgroundColor: Color(0xFFF5F6F8),
        primaryColor: Color(0xFFFF6969),
        accentColor: Color(0xFF353A50),
      ),
      home: new Directionality(
        textDirection: TextDirection.rtl,
        child: Splash(),
      ),
    );
  }
}
