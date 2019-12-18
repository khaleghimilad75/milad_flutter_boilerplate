class ExampleModel {
  var id;
  var name;
  var price;

  ExampleModel({
    this.id,
    this.name,
    this.price,
  });

  static List<ExampleModel> parsJson(List<dynamic> parsedJson) {
    List<ExampleModel> _data = [];
    if (parsedJson == null) return _data;
    for (int i = 0; i < parsedJson.length; i++) {
      ExampleModel exampleModel = new ExampleModel();
      if (parsedJson[i].containsKey('id'))
        exampleModel.id = parsedJson[i]['id'];
      if (parsedJson[i].containsKey('name'))
        exampleModel.name = parsedJson[i]['name'];
      if (parsedJson[i].containsKey('price'))
        exampleModel.price = parsedJson[i]['price'];
      _data.add(exampleModel);
    }
    return _data;
  }

}

List<ExampleModel> list = [
  new ExampleModel(name: "test",price: 1000,id: 1),
  new ExampleModel(name: "test",price: 1000,id: 1),
  new ExampleModel(name: "test",price: 1000,id: 1),
  new ExampleModel(name: "test",price: 1000,id: 1),
  new ExampleModel(name: "test",price: 1000,id: 1),
  new ExampleModel(name: "test",price: 1000,id: 1),
  new ExampleModel(name: "test",price: 1000,id: 1),
];
