import 'dart:convert';

import 'package:flutter_application_1/modelsApi/popular_model.dart';
import 'package:http/http.dart' as http;

class ApiPopular {
  Uri link = Uri.parse(
    "https://api.themoviedb.org/3/movie/popular?api_key=2af5224381fc019b9f13bf3ab7ea0389",
  );
  Future<List<PopularModel>> getAllPopular() async {
    var response = await http.get(link);
    if (response.statusCode == 200) {
      var jsonResult = jsonDecode(response.body)['results'] as List;
      return jsonResult
          .map((popular) => PopularModel.fromMap(popular))
          .toList();
    }
    throw Exception('Error al cargar películas: ${response.statusCode}');
  }
}
