import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:fluttertest/models/fact.dart';
import 'package:fluttertest/services/facts/fact-web-service.dart';

import 'fact-viewModel.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class FactListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  bool lastPage = false;
  int pageNumber = 1;
  List<FactViewModel> facts = <FactViewModel>[];

  void getFactsByPagination() async {
    if (!lastPage) {
      loadingStatus = LoadingStatus.searching;
      List<FactModel> newFacts =
          await FactWebService().fetchFactsByPageNumber(pageNumber);
      facts.addAll( newFacts.map((fact) => FactViewModel(fact: fact)).toList());

      print("pageNumber:${pageNumber.toString()}");
      if (facts.isEmpty) {
        loadingStatus = LoadingStatus.empty;
        lastPage = true;
      } else {
        pageNumber++;
        loadingStatus = LoadingStatus.completed;
      }
      notifyListeners();
    }
  }
}
