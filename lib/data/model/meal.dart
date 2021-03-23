import 'package:meta/meta.dart';

class Meal {
  final String id;
  final String name;
  final String thumbnail;

  Meal({@required this.id, @required this.name, @required this.thumbnail})
      : assert(name != null),
        assert(id != null),
        assert(thumbnail != null);

  Meal.fromJson(Map jsonMap)
      : assert(jsonMap['idMeal'] != null),
        assert(jsonMap['strMeal'] != null),
        assert(jsonMap['strMealThumb'] != null),
        id = jsonMap['idMeal'],
        name = jsonMap['strMeal'],
        thumbnail = jsonMap['strMealThumb'];
}
