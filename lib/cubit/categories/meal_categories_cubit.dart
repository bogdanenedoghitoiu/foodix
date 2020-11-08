import 'package:cubit/cubit.dart';
import 'package:foodix/cubit/categories/meal_categories_state.dart';
import 'package:foodix/data/repository/meal_repository.dart';
import 'package:meta/meta.dart';

class MealCategoriesCubit extends CubitStream<MealCategoriesState> {
  final MealRepository repository;

  MealCategoriesCubit({@required this.repository})
      : assert(repository != null),
        super(CategoriesInitial()) {
    getInitialData();
  }

  void getInitialData() async {
    try {
      emit(CategoriesLoading());

      final categories = await repository.getCategories();
      emit(CategoriesSuccess(categories));
    } catch (e) {
      emit(CategoriesError());
    }
  }

}