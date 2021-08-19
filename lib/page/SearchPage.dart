import 'package:flutter/material.dart';
import 'package:restaurantapp/theme.dart';

class SearchPage extends StatelessWidget {
  //const SearchPage({ Key? key }) : super(key: key);
  static const routeName = '/searchpage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Search',
                style: blackTextStyle.copyWith(fontSize: 25),
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term'),
              ),
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.search,
                      size: 250,
                    ),
                    Text(
                      'Data Not Found 404',
                      style: blackTextStyle.copyWith(fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
