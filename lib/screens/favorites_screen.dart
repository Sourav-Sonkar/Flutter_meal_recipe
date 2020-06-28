import 'package:flutter/material.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> favouriteMeals;

  FavoritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    print(favouriteMeals.toString());
    return Center(
      child: Text(""),

    );
  }
}
