import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //final Function removeItem;

  MealItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    //required this.removeItem
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.routeName, arguments: id).then((value) =>
        {
          if ( value != null){
            //removeItem(value)
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>  selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                        color: Colors.black54,
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    )))
              ],
            ),
            Padding(padding: EdgeInsets.all(20),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text('${duration} min')
                    ],),
                    Row(children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text('${complexity.name}')
                    ],),
                    Row(children: <Widget>[
                      Icon(Icons.money),
                      SizedBox(width: 6,),
                      Text('${affordability.name}')
                    ],)
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
