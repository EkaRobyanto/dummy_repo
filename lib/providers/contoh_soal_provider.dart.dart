// ignore_for_file: avoid_print, prefer_final_fields

import 'dart:convert';
import 'package:dummy/models/contoh_soal_models.dart.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ContohSoalProvider with ChangeNotifier {
  List<ContohSoalModel> _data = [];

  List<ContohSoalModel> get data => _data;

  String _code = "";

  String get code => _code;

  bool? _loading;

  bool? get loading => _loading;

  void setCode(String code) {
    _code = code;
    notifyListeners();
  }

  Future<List<ContohSoalModel>> getData(String code) async {
    _data = [];
    _loading = true;
    final response = await http.get(Uri.parse("put your goddamn api here"));

    if (response.statusCode == 200) {
      var dat = json.decode(response.body);
      _data = dat['questions']
          .map<ContohSoalModel>((json) => ContohSoalModel.fromJson(json))
          .toList();
      _loading = false;

      notifyListeners();
      return _data;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
