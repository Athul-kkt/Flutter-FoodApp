import 'package:FoodApp/dummy_data.dart.dart';
import 'package:FoodApp/models/category.dart';
import 'package:FoodApp/models/meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavModel extends ChangeNotifier{
  List<Meal> favmeal=[];
  String titleText;
  List<Category> catagoryToShow=DUMMY_CATEGORIES;
  List getmealsToshow()=>mealToShow;
  List<Meal> mealToShow;
  Meal detailMeal;
  bool buttonColor=false;
  bool isGlutenFree= false;
  bool isVegan=false;
  bool isVegetarian=false;
  bool isLactoseFree=false;
  List dummy_meal=[];
  void showALL(){
    for(int i=0;i<DUMMY_CATEGORIES.length;i++){
      catagoryToShow.add(DUMMY_CATEGORIES[i]);
    }
  }

  void addFav(meal){
    favmeal.add(meal);
    detailMeals(meal);
    notifyListeners();
  }
  void removeFav( id){
    for (var i = 0; i < favmeal.length; i++) {
      if(favmeal[i].id== id){
        favmeal.removeAt(i);
        buttonColor=false;
      }
    }
    notifyListeners();
  }
  void addMeal(cat,title){
    dummy_meal=[];
    if(isVegetarian==false && isVegan==false && isLactoseFree ==false && isGlutenFree == false){
      dummy_meal=DUMMY_MEALS.toList();
    }
    if(isGlutenFree==true){
      for (var i = 0; i < DUMMY_MEALS.length; i++) {
        if(DUMMY_MEALS[i].isGlutenFree==true && !dummy_meal.contains(DUMMY_MEALS[i])){
            dummy_meal.add(DUMMY_MEALS[i]);
        }
      }
    }
    if(isLactoseFree==true){
      for (var i = 0; i < DUMMY_MEALS.length; i++) {
        if(DUMMY_MEALS[i].isLactoseFree==true && !dummy_meal.contains(DUMMY_MEALS[i])){
            dummy_meal.add(DUMMY_MEALS[i]);
        }
      }
    }
    if(isVegetarian==true){
      for (var i = 0; i < DUMMY_MEALS.length; i++) {
        if(DUMMY_MEALS[i].isVegetarian==true && !dummy_meal.contains(DUMMY_MEALS[i])){
            dummy_meal.add(DUMMY_MEALS[i]);
        }
      }
    }
    if(isVegan==true){
      for (var i = 0; i < DUMMY_MEALS.length; i++) {
        if(DUMMY_MEALS[i].isVegan==true && !dummy_meal.contains(DUMMY_MEALS[i])){
            dummy_meal.add(DUMMY_MEALS[i]);
        }
      }
    }
    titleText=title;
    mealToShow=[];
    for (var i = 0; i < dummy_meal.length; i++) {
      for (var j = 0; j <  dummy_meal[i].categories.length; j++) {
        if(dummy_meal[i].categories[j]==cat){
            mealToShow.add(dummy_meal[i]);
            notifyListeners();
        }
      }
    }
  }
  void detailMeals(meals){
    buttonColor=false;
    detailMeal=meals;
    if(favmeal!=null){
      for (var i = 0; i < favmeal.length; i++) {
        if(favmeal[i].id==detailMeal.id){
          buttonColor=true;
        }
        else{
          buttonColor=false;
        }
      }
    }
    notifyListeners();
  }
 void addFilters(){
   notifyListeners();
 }
}