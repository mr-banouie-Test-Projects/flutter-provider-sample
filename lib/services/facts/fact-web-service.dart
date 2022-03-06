import 'package:dio/dio.dart';
import 'package:fluttertest/models/fact.dart';

import '../../Utils/MasterURL.dart';

class FactWebService {
  var dio = Dio();

  Future<List<FactModel>> fetchFactsByPageNumber(int pageNumber) async {
    final response = await dio.get(MasterURL.factURL+"?page=${pageNumber.toString()}");
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['data'];
      return list.map((fact) => FactModel.fromJson(fact)).toList();
    } else {
      throw Exception("Failed  to get data of facts");
    }
  }
}

