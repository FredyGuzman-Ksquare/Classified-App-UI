import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailScreen extends StatefulWidget {
  dynamic product;
  ProductDetailScreen({super.key, required this.product});
  _openURL(url) async {
    url = Uri.parse(url);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Error");
    }
  }

  @override
  State<ProductDetailScreen> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        backgroundColor: Colors.white,
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(widget.product["product"]["title"],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w900)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(widget.product["product"]["price"].toString() + ".0",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xffF25723),
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              width: 500,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/imageviewer", arguments: {
                      "images": widget.product["product"]["images"],
                    });
                  },
                  child: Image.network(widget.product["product"]["images"][0])),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 30.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(widget.product["product"]["createdBy"],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ]),
                  SizedBox(
                    width: 30,
                  ),
                  Row(children: <Widget>[
                    Icon(
                      Icons.access_alarm,
                      size: 30.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(widget.product["product"]["createdAt"],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400)),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text(widget.product["product"]["description"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 15, right: 15),
              child: ElevatedButton(
                onPressed: () {
                  widget._openURL(
                      "tel:+${widget.product["product"]["contactNumber"]}");
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                        top: 25, bottom: 25, right: 25, left: 25),
                    backgroundColor: Color(0xffF25723),
                    minimumSize: Size(150, 50)),
                child: const Text(
                  'Contact Seller',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
