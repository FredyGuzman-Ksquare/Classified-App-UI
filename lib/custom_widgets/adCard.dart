import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdCard extends StatelessWidget {
  String title;
  String time;
  int price;
  String imageURL;

  AdCard({
    super.key,
    required this.title,
    required this.time,
    required this.price,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/EditAd');
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
        height: 115,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 250, 250, 250),
            border: Border.all(
                width: 1.5, color: Color.fromARGB(255, 221, 221, 221))),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 3),
              child: Container(
                height: 95,
                width: 115,
                color: Colors.white,
                child: Image.asset(imageURL,
                    height: 95, width: 115, fit: BoxFit.fitHeight),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_alarm,
                        size: 20.0,
                        color: Color.fromARGB(255, 178, 178, 178),
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          color: Color.fromARGB(255, 178, 178, 178),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    price.toString() + '.0',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 129, 58, 1),
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
