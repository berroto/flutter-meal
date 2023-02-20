import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/widgets/meal_item.dart';

class FavouritiesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavouritiesScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ( favoriteMeals.isEmpty){
      return Center(child: Text("No Favorite"),);
    }
    return ListView.builder(itemBuilder: (ctx, index){
      return MealItem(id: favoriteMeals[index].id,title: favoriteMeals[index].title, imageUrl: favoriteMeals[index].imageUrl, duration: favoriteMeals[index].duration, complexity: favoriteMeals[index].complexity, affordability: favoriteMeals[index].affordability);

    });
  }
}
