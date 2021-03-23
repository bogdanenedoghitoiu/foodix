import 'package:equatable/equatable.dart';
import 'package:foodix/data/model/meal.dart';

abstract class MealsState extends Equatable {}

class MealsInitial extends MealsState {
  @override
  List<Object> get props => [];
}

class MealsLoading extends MealsState {
  @override
  List<Object> get props => [];
}

class MealsSuccess extends MealsState {
  final List<Meal> meals;

  @override
  List<Object> get props => [meals];

  MealsSuccess(this.meals);
}

class MealsError extends MealsState {
  @override
  List<Object> get props => [];
}