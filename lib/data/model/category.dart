import 'package:meta/meta.dart';

class Category {
  final String id;
  final String name;
  final String categoryThumbnail;
  final String description;

  Category(
      {@required this.id,
      @required this.name,
      @required this.categoryThumbnail,
      this.description})
      : assert(name != null),
        assert(id != null),
        assert(categoryThumbnail != null);

  Category.fromJson(Map jsonMap)
      : assert(jsonMap['idCategory'] != null),
        assert(jsonMap['strCategory'] != null),
        assert(jsonMap['strCategoryThumb'] != null),
        id = jsonMap['idCategory'],
        name = jsonMap['strCategory'],
        categoryThumbnail = jsonMap['strCategoryThumb'],
        description = jsonMap['strCategoryDescription'];
}
