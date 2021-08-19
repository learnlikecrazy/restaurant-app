import 'package:flutter/material.dart';
import 'package:restaurantapp/model/Restaurant.dart';
import 'DetailPage.dart';
import 'package:restaurantapp/theme.dart';

class HomePage extends StatelessWidget {
  //const HomePage({ Key? key }) : super(key: key);
  static const routeName = '/homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
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
                    future: DefaultAssetBundle.of(context)
                        .loadString('assets/local_restaurant.json'),
                    builder: (context, snapshot) {
                      final List<Restaurant> restaurant =
                          parseRestaurant(snapshot.data);
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('An error has occurred!'),
                        );
                      } else if (snapshot.hasData) {
                      return Container(
                        child: ListView.builder(itemCount:restaurant.length,
                        itemBuilder: (context,index){
                          return _buildRestaurantItem(context, restaurant[index]);
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

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Card(
      child: ListTile(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Image.network(
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
                  text: restaurant.rating.toString(), style: greyTextStyle.copyWith(fontSize: 13))
            ])),
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailPage.routeName, arguments: restaurant
          );
        },
      ),
    );
  }
}
