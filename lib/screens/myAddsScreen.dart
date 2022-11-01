import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/adCard.dart';

class MyAdsScreen extends StatelessWidget {
  MyAdsScreen({super.key});

  List textLines = [
    {
      "title": "iPod for Sale",
      "time": "5 mins ago",
      "price": 500,
      "imageURL": "graphics/airpods.jpg",
    },
    {
      "title": "Samsung A1 for Sale",
      "time": "8 mins ago",
      "price": 300,
      "imageURL": "graphics/airpods.jpg",
    },
    {
      "title": "iMac for Sale",
      "time": "50 mins ago",
      "price": 2500,
      "imageURL": "graphics/airpods.jpg",
    },
    {
      "title": "Moto G5 A1 for Sale",
      "time": "23 hours ago",
      "price": 100,
      "imageURL": "graphics/airpods.jpg",
    },
    {
      "title": "Yeti Mic A1 for Sale",
      "time": "2 days ago",
      "price": 100,
      "imageURL": "graphics/airpods.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Ads'),
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.black,
      ),
      body: Column(children: [
        Container(
          child: Expanded(
            child: ListView.builder(
                itemCount: textLines.length,
                itemBuilder: ((context, index) {
                  return AdCard(
                    title: textLines[index]['title'],
                    time: textLines[index]['time'],
                    price: textLines[index]['price'],
                    imageURL: textLines[index]['imageURL'],
                  );
                })),
          ),
        ),
      ]),
    );
  }
}
