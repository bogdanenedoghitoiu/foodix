import 'dart:async';

import 'package:foodix/data/api/api_client.dart';
import 'package:foodix/data/model/category.dart';
import 'package:foodix/data/model/meal.dart';
import 'package:meta/meta.dart';

class MealRepository {
  final ApiClient apiClient;

  MealRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<Category>> getCategories() async {
    return apiClient.getAllCategories();
  }

  Future<List<Meal>> getMeals(Category category) async {
    return apiClient.getMeals(category);
  }
}
