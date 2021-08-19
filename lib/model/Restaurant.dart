import 'dart:convert';

class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;
  // List <Menus> menus;

  Restaurant(
      {this.id,
      this.name,
      this.description,
      this.pictureId,
      this.city,
      this.rating,
      this.menus});

  factory Restaurant.fromJson(Map<dynamic, dynamic> restaurant) {
   
    return Restaurant(
      id: restaurant['id'],
      name: restaurant['name'],
      description: restaurant['description'],
      pictureId: restaurant['pictureId'],
      city: restaurant['city'],
      rating: restaurant['rating'].toDouble(),
      // menus: dataMenus,
      menus: Menus.fromJson(restaurant['menus']),
      //menus: null
    );
  }
}

class Menus {
  List <Foods> foods;
  List <Drink> drink;

  Menus({this.foods, this.drink});

  factory Menus.fromJson(Map<String, dynamic> menus) {
    var list = menus['foods'] as List;
    List<Foods> dataFoods = list.map((item) => Foods.fromJson(item)).toList();
    var list2 = menus['drinks'] as List;
    List<Drink> dataDrink = list2.map((item) => Drink.fromJson(item)).toList();
    return Menus(drink:dataDrink, foods: dataFoods);
  }
}

class Foods {
  String name;
  Foods({this.name});

  factory Foods.fromJson(Map<String, dynamic> foods) {
    return Foods(
      name: foods['name'],
    );
  }
}

class Drink {
  String name;
  Drink({this.name});

  factory Drink.fromJson(Map<String, dynamic> drink) {
    return Drink(name: drink['name']);
  }
}

// ignore: missing_return
List<Restaurant> parseRestaurant(dynamic json) {
  if (json == null) {
    return <Restaurant>[];
  }
  List parsed = jsonDecode(json)['restaurants'];
  return parsed.map<Restaurant>((json) => Restaurant.fromJson(json)).toList();
}
