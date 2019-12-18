import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _dialogMessage = "";
enum ProgressDialogType { Normal, Download }

ProgressDialogType _progressDialogType = ProgressDialogType.Normal;
double _progress = 0.0;

bool _isShowing = false;
var _onCancelDialog;

class ProgressDialog {
  _MyDialog _dialog;
  BuildContext _buildContext, _context;

  ProgressDialog(
      {@required BuildContext buildContext,
        @required ProgressDialogType progressDialogtype,
        @required onCancelDialog}) {
    _buildContext = buildContext;
    _progressDialogType = progressDialogtype;
    _onCancelDialog = onCancelDialog;
  }

  void setMessage(String mess) {
    _dialogMessage = mess;
  }

  void update({double progress, String message}) {
    if (_progressDialogType == ProgressDialogType.Download) {
      _progress = progress;
    }
    _dialogMessage = message;
    _dialog.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  void hide() {
    if (_isShowing) {
      _isShowing = false;
      Navigator.of(_context).pop();
    }
  }

  void show() {
    if (!_isShowing) {
      _dialog = new _MyDialog();
      _isShowing = true;
      showDialog<dynamic>(
        context: _buildContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          return _dialog;
        },
      );
    }
  }
}

// ignore: must_be_immutable
class _MyDialog extends StatefulWidget {
  // ignore: must_be_immutable
  var _dialog = new _MyDialogState();

  update() {
    _dialog.changeState();
  }

  @override
  // ignore: must_be_immutable
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _MyDialogState extends State<_MyDialog> {
  changeState() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _isShowing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(160, 0, 0, 0),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
                Container(
                  child: _progressDialogType == ProgressDialogType.Normal
                      ? Text("لطفا صبر کنید" + " \n " +  _dialogMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400))
                      : Stack(
                    children: <Widget>[
                      Positioned(
                        child: Text(_dialogMessage,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700)),
                        top: 35.0,
                      ),
                      Positioned(
                        child: Text("$_progress/100",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400)),
                        bottom: 15.0,
                        right: 15.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _onCancelDialog !=null ? Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: SizedBox(
                height: 36,
                width: 196,
                child: new RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: _onCancelDialog,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: new Text(
                    "لغو",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ) : Text("")
        ],
      ),
    );
  }
}

class MessageBox {
  BuildContext buildContext;
  String message = " ", title = " ";

  MessageBox(this.buildContext, this.message, this.title);

  void show() {
    _showDialog();
  }

  Future _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title, style: TextStyle(fontFamily: 'IranSans')),
          actions: <Widget>[
            FlatButton(
              child: Text('باشه' , style: TextStyle(fontFamily: 'IranSans'),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
          content: SizedBox(
            child: Center(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700], fontSize: 14.0 , fontFamily: 'IranSans'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    return null;
  }
}
