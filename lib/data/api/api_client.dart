import 'dart:async';
import 'dart:convert' show json, utf8;
import 'dart:io';

import 'package:foodix/data/model/category.dart';
import 'package:foodix/data/model/meal.dart';

class ApiClient {
  final HttpClient _httpClient = HttpClient();
  final String _baseURL = 'www.themealdb.com';

  Future<List<Category>> getAllCategories() async {
    final uri = Uri.https(_baseURL, '/api/json/v1/1/categories.php');
    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null || jsonResponse['categories'] == null) {
      print('Error retrieving the categories.');
      return null;
    }

    final categories = <Category>[];
    for (var c in jsonResponse['categories']) {
      categories.add(Category.fromJson(c));
    }

    return categories;
  }

  Future<List<Meal>> getMeals(Category category) async {
    final uri = Uri.https(_baseURL, '/api/json/v1/1/filter.php', {'c' : category.name});
    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null || jsonResponse['meals'] == null) {
      print('Error retrieving the meals filtered by category.');
      return null;
    }

    final meals = <Meal>[];
    for (var m in jsonResponse['meals']) {
      meals.add(Meal.fromJson(m));
    }

    return meals;
  }

  // Fetches and decodes a JSON object represented as a Dart [Map].
  // Returns null if the API server is down, or the response is not JSON.
  Future<Map<String, dynamic>> _getJson(Uri uri) async {
    final httpRequest = await _httpClient.getUrl(uri);
    final httpResponse = await httpRequest.close();
    if (httpResponse.statusCode != HttpStatus.ok) {
      return null;
    }
    // The response is sent as a Stream of bytes that we need to convert to a
    // `String`.
    final responseBody = await httpResponse.transform(utf8.decoder).join();
    // Finally, the string is parsed into a JSON object.
    return json.decode(responseBody);
  }

}