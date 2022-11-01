import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/productCard.dart';
import 'package:flutter_project/data/products.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final textLines = Products();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Ads Listing'), actions: [
          CircleAvatar(
            backgroundImage: AssetImage('graphics/logo.png'),
            backgroundColor: Color.fromARGB(255, 248, 248, 248),
            radius: 20,
          ),
        ]),
        body: Center(
          child: SizedBox(
            child: GridView.builder(
              padding: EdgeInsets.fromLTRB(20, 15, 15, 15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1),
              itemCount: textLines.ads.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  title: textLines.ads[index]['title'],
                  price: textLines.ads[index]['price'],
                  imageURL: textLines.ads[index]['images'][0],
                );
              },
            ),
          ),
        ));
  }
}
