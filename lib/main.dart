import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/app/foodix_app.dart';
import 'package:foodix/counter_observer.dart';

void main() {
  Bloc.observer = CounterObserver();

  runApp(const FoodixApp());
}
