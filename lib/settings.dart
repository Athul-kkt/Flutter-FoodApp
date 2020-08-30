import 'package:FoodApp/stateManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
      return Consumer<FavModel> (
      builder: (context, filter,child){ 
    return Scaffold(
      appBar: AppBar(
        title:Text('Settings'),
      ),
      body:
      Center(
        child:
        Column(
          children: [
          Text("Adjest your meal selection",style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),),
          ListTile(
            title:Text('Glutan-free'),
            subtitle: Text('Only include gultan free meals'),
            trailing: Switch(
              activeColor: Colors.yellow[700],
              value: filter.isGlutenFree,
              onChanged: (value){
                  filter.isGlutenFree=value;
                  filter.addFilters();
                  // filter.addGluttanFilter(value);
                  print(value);
              })

          ),
          ListTile(
            title:Text('Lactose-free'),
            subtitle: Text('Only include lactose free meals'),
            trailing: Switch(
              activeColor: Colors.yellow[700],
              value: filter.isLactoseFree,
              onChanged: (value){
                  filter.isLactoseFree=value;
                  filter.addFilters();
                  // filter.addLactosFilter(value);
                })

          ),
          ListTile(
            title:Text('Vegetarian'),
            subtitle: Text('Only include vegetarian meals'),
            trailing: Switch(
              activeColor: Colors.yellow[700],
              value: filter.isVegetarian,
              onChanged: (value){
                  filter.isVegetarian=value;
                  filter.addFilters();
                  // filter.addVegetarianFilter(value);
                })
          ),
          ListTile(
            title:Text('Vegan'),
            subtitle: Text('Only include vgen meals'),
            trailing: Switch(
              activeColor: Colors.yellow[700],
              value:  filter.isVegan,
              onChanged: (value){
                  filter.isVegan=value;
                  filter.addFilters();
                  // filter.addVeganFilter(value);
                })

          )  
        ],),
      ),
    );
    }
    );
  }
}