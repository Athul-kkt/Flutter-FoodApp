class Meal{
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final double duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final affordability;
  final complexity;
  
   const  Meal({ 
    this.id,
    this.categories,
    this.title,
    this.imageUrl,
    this.duration,
    this.ingredients,
    this.steps,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree,
    this.affordability,
    this.complexity,
    });
}
enum  Affordability{
    Affordable,
    Luxurious,
    Pricey
  }
enum Complexity{
  Challenging,
  Simple,
  Hard
}