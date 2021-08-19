import 'package:flutter/material.dart';
import 'package:restaurantapp/model/Restaurant.dart';
import 'package:restaurantapp/theme.dart';

class DetailPage extends StatelessWidget {
  //const DeatilPage({ Key? key }) : super(key: key);
  static const routeName = '/detailpage';

  final Restaurant restaurant;

  const DetailPage({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Expanded(
          child: ListView(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(restaurant.pictureId)),
              SizedBox(
                height: 20,
              ),
              Text(
                restaurant.name,
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/btn_location.png',
                    height: 30,
                    width: 30,
                  ),
                  Text(restaurant.city,
                      style: greyTextStyle.copyWith(fontSize: 15)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Deskripsi',
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              Text(
                restaurant.description,
                style: greyTextStyle.copyWith(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Menu',
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              Container(
                height: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Makanan',
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: restaurant.menus.foods.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _buildMenuFoods(
                                  context, restaurant.menus.foods[index].name),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Minuman',
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: restaurant.menus.drink.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _buildMenuDrinks(
                                  context, restaurant.menus.drink[index].name),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuFoods(BuildContext context, restaurant) {
    return Container(
      height: 130,
      color: Color(0xffF6F7F8),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Text(
              restaurant,
              style: blackTextStyle.copyWith(fontSize: 12),
            ),
            Image.asset(
              'assets/food.png',
              width: 70,
              height: 70,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuDrinks(BuildContext context, restaurant) {
    return Container(
      height: 130,
      color: Color(0xffF6F7F8),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Text(
              restaurant,
              style: blackTextStyle.copyWith(fontSize: 12),
            ),
            Image.asset(
              'assets/drink.png',
              width: 70,
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
