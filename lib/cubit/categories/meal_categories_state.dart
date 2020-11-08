import 'package:equatable/equatable.dart';
import 'package:foodix/data/model/category.dart';

abstract class MealCategoriesState extends Equatable {}

class CategoriesInitial extends MealCategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesLoading extends MealCategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesSuccess extends MealCategoriesState {
  final List<Category> categories;

  @override
  List<Object> get props => [categories];

  CategoriesSuccess(this.categories);
}

class CategoriesError extends MealCategoriesState {
  @override
  List<Object> get props => [];

  CategoriesError();
}