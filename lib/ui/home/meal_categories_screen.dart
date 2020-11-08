import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodix/cubit/categories/meal_categories_cubit.dart';
import 'package:foodix/cubit/categories/meal_categories_state.dart';
import 'package:foodix/data/model/category.dart';
import 'package:foodix/widgets/category_card.dart';
import 'package:foodix/widgets/search_bar.dart';

class MealCategoriesScreen extends StatefulWidget {
  MealCategoriesScreen();

  @override
  State<StatefulWidget> createState() => _MealCategoriesScreenState();
}

class _MealCategoriesScreenState extends State<MealCategoriesScreen> {
  List<Category> _categories = <Category>[];

  void _onCategoryTap(Category category) {
    //TODO: add Navigator.push towards meals screen
  }

  @override
  Widget build(BuildContext context) {
    return CubitConsumer<MealCategoriesCubit, MealCategoriesState>(
        builder: (context, state) {
          return _buildWidget(state);
        },
        listener: (context, state) {
          return _buildWidget(state);
        }
    );
  }

  Widget _buildWidget(MealCategoriesState state) {
    if (state is CategoriesLoading) {
      return _buildLoadingWidget();
    } else if (state is CategoriesSuccess) {
      return _buildCategoryWidgets(state);
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
      ],
    );
  }

  Widget _buildCategoryCards(Orientation deviceOrientation) {
    if (deviceOrientation == Orientation.portrait) {
      return Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: .85,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: _categories.map((Category c) {
            return  CategoryCard(
              title: c.name,
              imageSrc: "assets/icons/Meditation.svg",
              press: () {
                _onCategoryTap(c);
              },
            );
          }).toList(),
        ),
      );
    } else {
      return Expanded(
        child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: .85,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: _categories.map((Category c) {
            return  CategoryCard(
              title: c.name,
              imageSrc: "assets/icons/Meditation.svg",
              press: () {
                _onCategoryTap(c);
              },
            );
          }).toList(),
        ),
      );
    }
  }

  Widget _buildCategoryWidgets(CategoriesSuccess state) {
    List<Category> categories = state.categories;
    _categories = categories;

    assert(debugCheckHasMediaQuery(context));

    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .50,
          decoration: BoxDecoration(
            color: Color(0xFFF5CEB8),
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
            ),
          ),
        ),
        SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2BEA1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("assets/icons/menu.svg"),
                      ),
                    ),
                    Text(
                        "Main meal ingredients.",
                        style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.w900)
                    ),
                    SearchBar(),
                   _buildCategoryCards(MediaQuery.of(context).orientation),
                  ],
                )
            )
        ),
      ]),
    );
  }

  Widget _buildErrorBackdrop() {
    //TODO: implement this and the backdrop
  }
}