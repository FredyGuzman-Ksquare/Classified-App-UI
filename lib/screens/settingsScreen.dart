import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/productCard.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  openURL(url) async {
    url = Uri.parse(url);
    if (await launchUrl(url)) {
      await canLaunchUrl(url);
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Ads Listing'), actions: []),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('graphics/logo.png'),
                    backgroundColor: Color.fromARGB(255, 248, 248, 248),
                    radius: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Fredy",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "9621894299",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff898888)),
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/editprofile");
                      },
                      child: Text('Edit',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffF25723))))
                ],
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/myads");
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                  child: Row(
                    children: const [
                      Icon(
                          size: 40,
                          color: Color(0xff898888),
                          Icons.playlist_add),
                      SizedBox(width: 40),
                      Text("My Ads",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  openURL('https://appmaking.com/about/');
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                  child: Row(
                    children: const [
                      Icon(
                          size: 40,
                          color: Color(0xff898888),
                          Icons.person_outline),
                      SizedBox(width: 40),
                      Text("My Ads",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  openURL("https://appmaking.com/contact");
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                  child: Row(
                    children: const [
                      Icon(
                          size: 40,
                          color: Color(0xff898888),
                          Icons.contact_phone_outlined),
                      SizedBox(width: 40),
                      Text("My Ads",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
