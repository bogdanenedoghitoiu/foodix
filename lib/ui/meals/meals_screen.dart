import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:foodix/cubit/categories/meal_categories_state.dart';
import 'package:foodix/cubit/meals/meals_cubit.dart';
import 'package:foodix/cubit/meals/meals_state.dart';
import 'package:foodix/data/model/meal.dart';
import 'package:foodix/widgets/search_bar.dart';

class MealsScreen extends StatefulWidget {
  MealsScreen();

  @override
  State<StatefulWidget> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    return CubitConsumer<MealsCubit, MealsState>(
        builder: (context, state) {
        return _buildWidget(state);
      }, listener: (context, state) {
        return _buildWidget(state);
      }
    );
  }

  void _onMealTap(Meal meal) {
    //TODO: add Navigator.push towards the meal details screen
  }

  Widget _buildWidget(MealsState state) {
    if (state is MealsLoading) {
      return _buildLoadingWidget();
    } else if (state is MealsSuccess) {
      return _buildMealsWidgets(state);
    } else if (state is CategoriesError) {
      return _buildErrorBackdrop();
    } else {
      return Container();
    }
  }

  Widget _buildLoadingWidget() {
    return Stack(
      children: [
        Center(
          child: CircularProgressIndicator(),
        )
      ]
    );
  }

  Widget _buildErrorBackdrop() {
    //TODO: implement error backdrop
  }

  Widget _buildMealsWidgets(MealsSuccess state) {
    List<Meal> meals = state.meals;

    assert(debugCheckHasMediaQuery(context));

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .50,
            decoration: BoxDecoration(
              color: Color(0xFFC7B8F5),
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text(
                      "Meal ideas",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: Text(
                          "Live happier by learning to cook healthy and delicious meals!"),
                    ),
                    SizedBox(
                      child: SearchBar(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Meals:",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: Color(0xFFE6E6E6),
                          ),
                        ],
                      ),
                      //TODO: add a list of rows based on the API meals by category method
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealEntries(Orientation deviceOrientation) {

  }
}
