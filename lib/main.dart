import 'package:flutter/material.dart';
import 'package:restaurantapp/model/Restaurant.dart';
import 'package:restaurantapp/page/HomePage.dart';
import 'package:restaurantapp/page/DetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
       HomePage.routeName: (context) => HomePage(),
       DetailPage.routeName: (context) => DetailPage(),
        DetailPage.routeName: (context) => DetailPage(
              restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
        // ArticleWebView.routeName: (context) => ArticleWebView(
        //       url: ModalRoute.of(context)?.settings.arguments as String,
            ),
      },
    );
  }
}
