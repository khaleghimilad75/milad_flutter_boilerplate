import 'package:flutter/material.dart';

import '../blocs/logIn_bloc.dart';
import '../widgets/progress_dialog.dart';
import 'home.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  var _username = new TextEditingController();
  var _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: new Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
          body: _body(),
        ),
      ),
      onWillPop: _onWiilPop,
    );
  }

  Widget _body() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 48),
            child: new Card(
              child: new Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: _form(),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(128),
                  topLeft: Radius.circular(128),
                ),
              ),
              elevation: 8,
              margin: EdgeInsets.only(right: 0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: FloatingActionButton(
                onPressed: () {
                  _logIn();
                },
                child: Icon(Icons.arrow_forward),
                elevation: 8,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _form() {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextField(
          controller: _username,
          style: TextStyle(color: Colors.grey[800], decorationThickness: 0),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(0),
            ),
            hintText: "نام کاربری(admin)",
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        Divider(),
        TextField(
          controller: _password,
          textInputAction: TextInputAction.done,
          style: TextStyle(color: Colors.grey[800], decorationThickness: 0),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.aspect_ratio),
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(0),
            ),
            hintText: "کلمه عبور(1234)",
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Future<bool> _onWiilPop() async {
    return false;
  }

  Future _logIn() async {
    ProgressDialog progress = new ProgressDialog(
        buildContext: context,
        progressDialogtype: ProgressDialogType.Normal,
        onCancelDialog: null);
    progress.show();
    bool status = await logInBloc.logIn(_username.text, _password.text);
    if (status){
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
    progress.hide();


  }
}
