import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/adCard.dart';
import 'package:flutter_project/services/ads.dart';

import '../model/ads.dart';
import '../model/products.dart';
import '../utils/strings.dart';

class MyAdsScreen extends StatelessWidget {
  MyAdsScreen({super.key});
  final textLines = Products();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.myAds),
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
            child: FutureBuilder(
                future: AdService().fetchMyPosts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Ad> myProductsAds = snapshot.data!;
                    return ListView.builder(
                        itemCount: myProductsAds.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/editad",
                                  arguments: {
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
                        }));
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
