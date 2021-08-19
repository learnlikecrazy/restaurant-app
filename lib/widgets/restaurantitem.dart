import 'package:flutter/material.dart';
import 'package:restaurantapp/model/Restaurant.dart';
import 'package:restaurantapp/page/DetailPage.dart';
import 'package:restaurantapp/theme.dart';

// ignore: must_be_immutable
class RestaurantItem extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  RestaurantList restaurant;

  RestaurantItem({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Image.network(
          'https://restaurant-api.dicoding.dev/images/small/' +
              restaurant.pictureId,
          width: 100,
        ),
        title: Text(
          restaurant.name,
          style: blackTextStyle.copyWith(fontSize: 18),
        ),
        subtitle: Text.rich(TextSpan(
            text: '${restaurant.city} \n',
            style: greyTextStyle.copyWith(fontSize: 15),
            children: [
              TextSpan(
                  text: restaurant.rating.toString(),
                  style: greyTextStyle.copyWith(fontSize: 13))
            ])),
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName,
              arguments: restaurant);
        },
      ),
    );
  }
}
