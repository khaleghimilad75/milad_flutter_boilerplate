import 'package:flutter/material.dart';
import '../../blocs/example_list_bloc.dart';
import '../../models/example_model.dart';

import 'example_item.dart';
class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void initState() {
    super.initState();
    exampleListBloc.fetchExampleList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: exampleListBloc.getExampleList,
      builder: (context, AsyncSnapshot<List<ExampleModel>> snapshot) {
        if (snapshot.hasData) {
          return _content(snapshot.data);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  _content(List<ExampleModel> data){
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ExampleItem(exampleModel: data[index],);
      },
    );
  }
}
