// import 'dart:convert';

import 'dart:convert';

class RestaurantList {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  // List <Menus> menus;

  RestaurantList({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  factory RestaurantList.fromJson(Map<String, dynamic> restaurant) {
    return RestaurantList(
      id: restaurant['id'],
      name: restaurant['name'],
      description: restaurant['description'],
      pictureId: restaurant['pictureId'],
      city: restaurant['city'],
      rating: restaurant['rating'].toDouble(),
    );
  }
}

class RestaurantDetail {
  bool error;
  String message;
  Restaurant restaurant;

  RestaurantDetail({this.error, this.message, this.restaurant});

  factory RestaurantDetail.fromJson(Map<String, dynamic> restaurant) {
    return RestaurantDetail(
        error: restaurant['error'],
        message: restaurant['message'],
        restaurant: Restaurant.fromJson(restaurant['restaurant']));
  }
}

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

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) {
    return Restaurant(
      id: restaurant['id'],
      name: restaurant['name'],
      description: restaurant['description'],
      pictureId: restaurant['pictureId'],
      city: restaurant['city'],
      menus: Menus.fromJson(restaurant['menus']),
    );
  }
}

class Menus {
  List<Foods> foods;
  List<Drink> drink;

  Menus({this.foods, this.drink});

  factory Menus.fromJson(Map<String, dynamic> menus) {
    var list = menus['foods'] as List;
    List<Foods> dataFoods = list.map((item) => Foods.fromJson(item)).toList();
    var list2 = menus['drinks'] as List;
    List<Drink> dataDrink = list2.map((item) => Drink.fromJson(item)).toList();
    return Menus(drink: dataDrink, foods: dataFoods);
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
// List<Restaurant> parseRestaurant(dynamic json) {
//   if (json == null) {
//     return <Restaurant>[];
//   }
//   List parsed = jsonDecode(json)['restaurants'];
//   return parsed.map<Restaurant>((json) => Restaurant.fromJson(json)).toList();
// }
 