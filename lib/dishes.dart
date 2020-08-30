import 'package:FoodApp/stateManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Recipes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<FavModel> (
      builder: (context, fav,child){
    return Scaffold(
      appBar: AppBar(
        title: Text(fav.titleText),
      ),
      body:  SingleChildScrollView(child:
      Column(children: [
          for (var i = 0; i < fav.getmealsToshow().length; i++) 
            InkWell(
              child: 
            Card(
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(15)
              ),
              child:
              Container(
                child:
              Column(
                children:[
                  Stack(
                    alignment: Alignment.bottomRight,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            child: Image.network(
                             fav.mealToShow[i].imageUrl,     
                              fit: BoxFit.cover,
                
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          padding: EdgeInsets.only(bottom: 30),
                          child: 
                          Opacity(
                            opacity: 0.5,
                            child:  Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              color: Colors.black,
                              child:   Text(
                                fav.mealToShow[i].title,
                                style: TextStyle(
                                  fontWeight:FontWeight.bold,
                                  fontSize:30,
                                  color: Colors.white
                                  ),
                                ),
                            ),
                          )
                          )
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Row(children: [
                      Icon(Icons.timer,size: 25,),
                      Text('${fav.mealToShow[i].duration}Min',style: TextStyle(fontSize:15),),
                    ],),
                    Row(children: [
                      Icon(Icons.work,size: 25,),
                      Text(fav.mealToShow[i].complexity.toString().split('.')[1],style: TextStyle(fontSize:15),),
                    ],),
                    Row(children: [
                      Icon(Icons.money_off,size: 25,),
                      Text(fav.mealToShow[i].affordability.toString().split('.')[1],style: TextStyle(fontSize:15),),
                    ],),
                  ],)
                ]),
              ),
            ),
            onTap: (){
              var mealstoShow=Provider.of<FavModel>(context,listen: false);
              mealstoShow.detailMeals(fav.mealToShow[i]);
              Navigator.pushNamed(context, '/details');
            },
          )
        ],)
        )
      );
    });
  }
}