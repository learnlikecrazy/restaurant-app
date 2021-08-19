import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:restaurantapp/model/Restaurant.dart';

class RestaurantProvider extends ChangeNotifier {
  String baseUrl = 'https://restaurant-api.dicoding.dev/';
  String list = 'list';
  String detail = 'detail/';
  getRestaurantList() async {
    var url = Uri.parse(baseUrl + list);
    var getResult = await http.get(url);

    if (getResult.statusCode == 200) {
      List data = jsonDecode(getResult.body)['restaurants'];
      List<RestaurantList> restaurant =
          data.map((item) => RestaurantList.fromJson(item)).toList();
      print(restaurant);
      return restaurant;
    } else {
      throw Exception('Failed to load data');
    }
  }

  getRestaurantDetail(id) async {
    var url = Uri.parse(baseUrl + detail + id);

    var getResult = await http.get(url);

    if (getResult.statusCode == 200) {
      var data = RestaurantDetail.fromJson(jsonDecode(getResult.body));
      print(data);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
