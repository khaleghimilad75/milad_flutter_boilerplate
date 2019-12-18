import 'package:flutter/material.dart';
import '../../models/example_model.dart';

class ExampleItem extends StatelessWidget {
  final ExampleModel exampleModel;

  const ExampleItem({Key key, @required this.exampleModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("id : " + exampleModel.id.toString()),
            Divider(),
            Text("name : " + exampleModel.name),
            Padding(padding: EdgeInsets.symmetric(vertical: 2)),
            Text("price : " + exampleModel.price.toString()),
          ],
        ),
      ),
    );
  }
}
