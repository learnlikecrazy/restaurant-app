import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/model/Restaurant.dart';
import 'package:restaurantapp/page/SearchPage.dart';
import 'package:restaurantapp/providers/restaurant_provider.dart';
import 'package:restaurantapp/widgets/restaurantitem.dart';
import 'package:restaurantapp/theme.dart';

class HomePage extends StatelessWidget {
  //const HomePage({ Key? key }) : super(key: key);
  static const routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    var restaurantProvider = Provider.of<RestaurantProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.pushNamed(context, SearchPage.routeName);
                  },
                ),
              ),
              Text.rich(TextSpan(
                  text: 'Restaurant \n',
                  style: blackTextStyle.copyWith(fontSize: 18),
                  children: [
                    TextSpan(
                        text: 'Recommendation Restaurant For You',
                        style: greyTextStyle.copyWith(fontSize: 15))
                  ])),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder<dynamic>(
                    future: restaurantProvider.getRestaurantList(),
                    builder: (context, snapshot) {
                      final List<RestaurantList> restaurant = snapshot.data;
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('An error has occurred!'),
                        );
                      } else if (snapshot.hasData) {
                        return Container(
                          child: ListView.builder(
                              itemCount: restaurant.length,
                              itemBuilder: (context, index) {
                                // return _buildRestaurantItem(
                                //     context, restaurant[index]);
                                return RestaurantItem(
                                    restaurant: restaurant[index]);
                              }),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
