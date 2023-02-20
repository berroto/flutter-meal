  import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();

  const CategoryMealsScreen({Key? key, required this.availableMeals}) : super(key: key);

}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  bool loadInitDate = false;

   @override
  void didChangeDependencies() {
     if ( !loadInitDate) {
       final routeArgs = ModalRoute
           .of(context)
           ?.settings
           .arguments as Map<String, String>;
       categoryTitle = routeArgs['title'] as String;
       final categoryId = routeArgs['id'] as String;
       displayedMeals =
           widget.availableMeals.where((meal) => meal.categories.contains(categoryId))
               .toList();
       loadInitDate = true;
     }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(itemBuilder: (ctx, index) {
        Meal meal  = displayedMeals[index];
        return MealItem(id: meal.id,title: meal.title, imageUrl: meal.imageUrl, duration: meal.duration, complexity: meal.complexity, affordability: meal.affordability);
      }, itemCount: displayedMeals.length)
    );
  }
}
