import 'package:FoodApp/dummy_data.dart.dart';
import 'package:FoodApp/stateManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
 final fav = FavModel();
  @override
  Widget build(BuildContext context) {
  return GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    for(int i=0;i<DUMMY_CATEGORIES.length;i++)
    InkWell(
      child:
        Container(
          padding: const EdgeInsets.symmetric(horizontal:20,vertical:50),
          child: Text(DUMMY_CATEGORIES[i].title,style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
             gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, DUMMY_CATEGORIES[i].color]),
            // color: DUMMY_CATEGORIES[i].color,
          ),
        ),
      onTap:(){
        print('taped$i');
        var mealstoShow=Provider.of<FavModel>(context,listen: false);
        mealstoShow.addMeal(DUMMY_CATEGORIES[i].id, DUMMY_CATEGORIES[i].title);
         Navigator.pushNamed(context, '/recipe');
        }
    )
    
      
      ],
    );
   
  }
}