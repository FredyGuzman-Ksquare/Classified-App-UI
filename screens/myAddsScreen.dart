import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/adCard.dart';

import '../data/products.dart';

class MyAdsScreen extends StatelessWidget {
  MyAdsScreen({super.key});
  final textLines = Products();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Ads'),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        backgroundColor: Colors.black,
      ),
      body: Column(children: [
        Container(
          child: Expanded(
            child: ListView.builder(
                itemCount: textLines.ads.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/editad", arguments: {
                        "product": textLines.ads[index],
                      });
                    },
                    child: AdCard(
                      title: textLines.ads[index]['title'],
                      time: textLines.ads[index]['createdAt'],
                      price: textLines.ads[index]['price'],
                      imageURL: textLines.ads[index]['images'][0],
                    ),
                  );
                })),
          ),
        ),
      ]),
    );
  }
}
