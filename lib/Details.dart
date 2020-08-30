import 'package:FoodApp/stateManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavModel> (
      builder: (context, fav,child){
    return Scaffold(
      appBar: AppBar(
        title: Text(fav.detailMeal.title),
      ),
      body:  SingleChildScrollView(
        child:
        Container(child:
        Column(children: [ 
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Image.network(
                fav.detailMeal.imageUrl,     
                fit: BoxFit.cover,
                ),
          ),
          Text('Ingredients',style: TextStyle(fontSize:30,fontWeight: FontWeight.bold),),
          Card(
            child:Container(
              height: 150,
              width: 300,
              child: ListView.builder(
                itemCount: fav.detailMeal.ingredients.length,
                itemBuilder: (context,i){
                  return SingleChildScrollView(
                    child:
                    Container(
                      padding: EdgeInsets.all(2),
                      child:
                        Card(
                          color: Colors.yellow,
                          child:
                          Container(
                            padding: EdgeInsets.all(3),
                            child:
                            Text(fav.detailMeal.ingredients[i],style: TextStyle(fontSize:20),),
                          ),
                        ),
                    ),
                  );
                }
                ),
            )
          ),
          Text('Steps',style: TextStyle(fontSize:30,fontWeight: FontWeight.bold),),
          Card(
            child:
            Container(
              height: 150,
              width: 300,
              child:
              ListView.builder(
                itemCount: fav.detailMeal.steps.length,
                itemBuilder: (context,i){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text('#${i+1}'),
                    ),
                    title: Text(fav.detailMeal.steps[i],style: TextStyle(fontSize:20),),
                  );
                }
                )
            ),
          )        
        ]),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(!fav.buttonColor?Icons.star_border:Icons.star,color: Colors.yellow,),
        onPressed: (){
          var favMeal=Provider.of<FavModel>(context,listen: false);
          if(fav.buttonColor==true){
            favMeal.removeFav(fav.detailMeal.id);
          }
          else {
            favMeal.addFav(fav.detailMeal);
          }
        }
        ),
    );
  });
}
}