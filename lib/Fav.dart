import 'package:FoodApp/stateManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Fav extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<FavModel> (
      builder: (context, fav,child){
    return SingleChildScrollView(
      child:fav.favmeal.length!=0?
        Column(children: [
            for (var i = 0; i < fav.favmeal.length; i++) 
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
                              fav.favmeal[i].imageUrl,     
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
                                  fav.favmeal[i].title,
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
                        Text('${fav.favmeal[i].duration}Min',style: TextStyle(fontSize:15),),
                      ],),
                      Row(children: [
                        Icon(Icons.work,size: 25,),
                        Text(fav.favmeal[i].complexity.toString().split('.')[1],style: TextStyle(fontSize:15),),
                      ],),
                      Row(children: [
                        Icon(Icons.money_off,size: 25,),
                        Text(fav.favmeal[i].affordability.toString().split('.')[1],style: TextStyle(fontSize:15),),
                      ],),
                    ],)
                  ]),
                ),
              ),
              onTap: (){
                var mealstoShow=Provider.of<FavModel>(context,listen: false);
                mealstoShow.detailMeals(fav.favmeal[i]);
                Navigator.pushNamed(context, '/details');
              },
            )
          ],):Center(
            child: Text('No Faverite added',style: TextStyle(fontSize:30,fontWeight: FontWeight.bold),)
          )

      );
    });
  }
}