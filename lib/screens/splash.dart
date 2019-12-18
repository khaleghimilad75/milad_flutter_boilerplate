import 'dart:async';

import 'package:flutter/material.dart';

import '../resources/storage.dart';
import 'home.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() => Timer(new Duration(seconds: 2), _goToLogIn);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    navigationPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
      child: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }

  navigationPage() async {
    if (await Storage.getApiToken() == null) {
      startTime();
    } else {
      debugPrint("api : " + await Storage.getApiToken());
      _goToApp();
    }
  }

  _goToLogIn() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(
        builder: (context) => LogIn(),
      ),
    );
  }

  Future _goToApp() async {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }
}
