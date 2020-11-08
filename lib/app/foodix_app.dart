import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:foodix/constants.dart';
import 'package:foodix/cubit/categories/meal_categories_cubit.dart';
import 'package:foodix/ui/home/meal_categories_screen.dart';

import '../dependency_injection.dart';

class FoodixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodix',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: textColor),
      ),
      home: CubitProvider<MealCategoriesCubit>(
        create: (context) => getIt.get<MealCategoriesCubit>(),
        child: MealCategoriesScreen(),
      ),
    );
  }
}
