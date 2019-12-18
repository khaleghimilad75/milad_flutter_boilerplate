import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const int ColorPrimary = 0;
  static const int ColorWhite = 1;

  final double width;
  final double height;
  final String title;
  final int colorType;
  final IconData icon;

  final onPress;

  const Button(
      {Key key,
      this.width,
      this.height,
      this.title,
      this.colorType,
      this.icon,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: colorType == ColorPrimary
                  ? Theme.of(context).primaryColor
                  : Colors.grey[300],
              offset: Offset(1, 1),
              blurRadius: 4,
              spreadRadius: 1,
            )
          ],
          color: colorType == ColorPrimary
              ? Theme.of(context).primaryColor
              : Colors.white,
          borderRadius: new BorderRadius.all(
            const Radius.circular(30),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: icon == null ? Text("") : SizedBox(
                  width: height - 16,
                  height: height - 16,
                  child: Container(
                    decoration: new BoxDecoration(
                      color: colorType == ColorPrimary
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      borderRadius: new BorderRadius.all(
                        const Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        icon,
                        size: height - 24,
                        color: colorType == ColorPrimary
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: colorType == ColorPrimary
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
