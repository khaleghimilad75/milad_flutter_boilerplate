import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/home/body.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: buildDrawerLayout(context),
        appBar: AppBar(
          elevation: 0,
          title: Text("اسپرلوس"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: InkWell(
                child: Icon(Icons.call_to_action),
                onTap: (){
                  // TODO Your Action
                  _scaffoldKey.currentState
                      .showSnackBar(SnackBar(content: Text("Do Something")));
                },
              ),
            ),
          ],
        ),
        body: Body(),
      ),
    );
  }
}
