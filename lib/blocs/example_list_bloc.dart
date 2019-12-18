import 'dart:convert';

import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

import '../models/example_model.dart';
import '../resources/repository.dart';

class ExampleListBloc {
  final _repository = Repository();

  // ignore: close_sinks
  final _exampleList = PublishSubject<List<ExampleModel>>();

  Observable<List<ExampleModel>> get getExampleList => _exampleList.stream;

  fetchExampleList() async {
    Future.delayed(const Duration(milliseconds: 1000), () {
      List<ExampleModel> dummyData = list;
      _exampleList.sink.add(dummyData);
    });
    return;
    /**
     * Example Real Fetch Data From Web Service
     */
    Response _response = await _repository.fetchExampleList();
    if (_response.statusCode == 200){
      dynamic _body = json.decode(_response.body);
      _exampleList.sink.add(ExampleModel.parsJson(_body['data']));
    } else {
      // TODO What you want
    }
  }
}

final exampleListBloc = ExampleListBloc();
