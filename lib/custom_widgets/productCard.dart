import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  String title;
  int price;
  String imageURL;

  ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: SizedBox(
          child: Container(
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.network(imageURL, fit: BoxFit.cover),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 25,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Icon(
                            Icons.favorite_border_outlined,
                            size: 25,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  //height: 125,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: 75,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                            Text('\$ ${price.toString()}',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 249, 164, 85),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
