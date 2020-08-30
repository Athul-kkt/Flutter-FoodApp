import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(50),
              color: Colors.yellow[600],
              child:
                ListTile(
                  title: Text('Cook Up!',style :TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize:50))
                ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical:10),
              leading: Icon(Icons.restaurant),
              title: Text("Meal",style :TextStyle(fontWeight: FontWeight.bold,fontSize:30)),
              onTap:()=>Navigator.pop(context),
            ),
            ListTile(
              contentPadding:EdgeInsets.symmetric(horizontal: 20),
              leading: Icon(Icons.settings),
              title: Text("Filters",style :TextStyle(fontWeight: FontWeight.bold,fontSize:30)),
              onTap: ()=>Navigator.pushNamed(context, '/settings'),
            )
        ],)
      );
  }
}