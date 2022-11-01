import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/productCard.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Ads Listing'), actions: []),
        body: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('graphics/logo.png'),
                  backgroundColor: Color.fromARGB(255, 248, 248, 248),
                  radius: 20,
                ),
                Column(),
                TextButton(
                    onPressed: () {},
                    child: Text('Edit',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffF25723))))
              ],
            ),
            Row(),
            Row(),
            Row(),
          ],
        ));
  }
}
