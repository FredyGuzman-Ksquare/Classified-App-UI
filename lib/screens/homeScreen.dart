import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/productCard.dart';
import 'package:flutter_project/model/products.dart';

import '../custom_widgets/customCircleAvatar.dart';
import '../model/ads.dart';
import '../services/ads.dart';
import '../utils/strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final textLines = Products();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(Strings.adsListing),
          actions: [CustomCircleAvatar().customProfileAvatar(context)]),
      body: Center(
        child: SizedBox(
          child: FutureBuilder(
            future: AdService().fetchUserPosts(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                List<Ad> ads = snapshot.data!;
                //print(ads[0].);
                return GridView.builder(
                    padding: EdgeInsets.fromLTRB(20, 15, 15, 15),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1),
                    itemCount: ads.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/productdetail",
                                arguments: {
                                  "product": ads[index],
                                });
                          },
                          child: ProductCard(
                            title: ads[index].title!,
                            price: ads[index].price!.toDouble(),
                            image: ads[index].images![0],
                          ));
                    });
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Something wrong"),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/createad");
        },
        backgroundColor: const Color(0xfff25723),
        child: const Icon(Icons.add_photo_alternate_outlined),
      ),
    );
  }
}
