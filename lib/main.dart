import 'package:FoodApp/Categories.dart';
import 'package:FoodApp/Details.dart';
import 'package:FoodApp/dishes.dart';
import 'package:FoodApp/fav.dart';
import 'package:FoodApp/menu.dart';
import 'package:FoodApp/settings.dart';
import 'package:FoodApp/stateManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => FavModel(),
      child: MyApp(),
    ),);
}
String text;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Colors.yellow[100],
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> MyHomePage(),
        '/recipe':(context)=>Recipes(),
        '/settings':(context)=>Settings(),
        '/details':(context)=>Details(),
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int val=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: val==0?Text('Categories'):Text('Faverite')
      ),
      drawer: Menu(),
      body: val==0?Categories():Fav(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        items:[
          BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: Icon(Icons.category,color: val==1?Colors.white:Colors.yellow,),
            title: Text('Categories',style: TextStyle(color: val==1?Colors.white:Colors.yellow)),
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border,color: val==0?Colors.white:Colors.yellow,),
            title: Text('Faverite',style: TextStyle(color:val==0?Colors.white:Colors.yellow)),
          ),
        ],
        onTap: (index){
          setState(() {
            val=index;
          });
        },
      
        ),

    );
  }
}
