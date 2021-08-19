import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/model/Restaurant.dart';
import 'package:restaurantapp/page/HomePage.dart';
import 'package:restaurantapp/page/DetailPage.dart';
import 'package:restaurantapp/page/SearchPage.dart';
import 'package:restaurantapp/providers/restaurant_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RestaurantProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          SearchPage.routeName: (context) => SearchPage(),
          // DetailPage.routeName: (context) => DetailPage(),
          DetailPage.routeName: (context) => DetailPage(
                restaurant:
                    ModalRoute.of(context).settings.arguments as RestaurantList,
                // ArticleWebView.routeName: (context) => ArticleWebView(
                //       url: ModalRoute.of(context)?.settings.arguments as String,
              ),
        },
      ),
    );
  }
}
