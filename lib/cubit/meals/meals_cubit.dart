import 'package:cubit/cubit.dart';
import 'package:foodix/cubit/meals/meals_state.dart';
import 'package:foodix/data/model/category.dart';
import 'package:foodix/data/repository/meal_repository.dart';
import 'package:meta/meta.dart';

class MealsCubit extends CubitStream<MealsState> {
  final MealRepository repository;

  MealsCubit({@required this.repository})
      :assert(repository != null),
        super(MealsInitial()) {
      emit(MealsInitial());
  }

  void getMeals(Category category) async {
    try {
      emit(MealsLoading());
      final meals = await repository.getMeals(category);
      emit(MealsSuccess(meals));
    } catch (exception) {
      emit(MealsError());
    }
  }
}