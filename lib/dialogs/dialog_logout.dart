import 'package:flutter/material.dart';

import '../resources/storage.dart';
import '../screens/splash.dart';

class DialogLogout extends StatefulWidget {
  const DialogLogout({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DialogLogoutState();
}

class DialogLogoutState extends State<DialogLogout>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  bool online = false;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 550));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    controller.forward();
    online = false;
  }

  @override
  Widget build(BuildContext context) {
    return new Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: new Padding(
              padding: EdgeInsets.all(32),
              child: new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Align(
                        alignment: Alignment.center,
                        child: Text(
                          "خروج از حساب کاربری",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: new Align(
                          alignment: Alignment.center,
                          child: Text(
                            "آیا واقعا میخواهید خارج شوید؟",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new FlatButton(
                            onPressed: () {
                              Storage.clear();
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => Splash()));
                            },
                            child: new Text(
                              "آره",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          new FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: new Text(
                              "نه",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
