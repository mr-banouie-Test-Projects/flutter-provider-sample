import 'package:fluttertest/models/fact.dart';

class FactViewModel {
  final FactModel _fact;

  FactViewModel({required FactModel fact}) : _fact = fact;

  String get fact {
    return _fact.fact;
  }
  String get imageURL {
    return _fact.imageURL;
  }
  int get length {
    return _fact.length;
  }
}
