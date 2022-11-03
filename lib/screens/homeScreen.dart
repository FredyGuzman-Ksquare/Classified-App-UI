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
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/settings");
          },
          child: CircleAvatar(
            backgroundImage: AssetImage('graphics/logo.png'),
            backgroundColor: Color.fromARGB(255, 248, 248, 248),
            radius: 20,
          ),
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
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/productdetail", arguments: {
                    "product": textLines.ads[index],
                  });
                },
                child: ProductCard(
                  title: textLines.ads[index]['title'],
                  price: textLines.ads[index]['price'],
                  imageURL: textLines.ads[index]['images'][0],
                ),
              );
            },
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
