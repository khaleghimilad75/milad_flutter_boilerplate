import 'package:flutter/material.dart';
import '../dialogs/dialog_logout.dart';

Drawer buildDrawerLayout(BuildContext context) {
  return new Drawer(
    elevation: 4,
    child: new Container(
      padding: EdgeInsets.all(0),
      color: Theme.of(context).accentColor,
      child: new ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          new Container(
            width: double.infinity,
            height: 120,
            margin: EdgeInsets.all(32),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/logo.png"),
              ),
            ),
          ),
          new ListTile(
            leading: new Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            title: new Text(
              'خروج',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () async {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => DialogLogout(),
              );
            },
          ),
        ],
      ),
    ),
  );
}
