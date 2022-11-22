import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/productCard.dart';
import 'package:flutter_project/services/profile.dart';
import 'package:flutter_project/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/alert_manager.dart';
import '../utils/strings.dart';
import '../utils/urlLauncher.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(Strings.adsListing),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back))),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(left: 25, top: 25),
            child: Column(
              children: [
                FutureBuilder(
                    future: ProfileService().myUserPost(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        Map userData = snapshot.data!;

                        return Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  userData["imgURL"] ?? Constants.defaultImage),
                              backgroundColor:
                                  Color.fromARGB(255, 248, 248, 248),
                              radius: 20,
                            ),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userData['name'],
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  userData['phone'],
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xff898888)),
                                )
                              ],
                            ),
                            SizedBox(width: 80),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/editprofile");
                                },
                                child: Text(Strings.edit,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffF25723))))
                          ],
                        );
                      }
                      if (snapshot.hasError) {
                        AlertManager().displaySnackbar(context, "Error");
                      }
                      return CircularProgressIndicator();
                    })),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/myads");
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                            size: 40,
                            color: Color(0xff898888),
                            Icons.playlist_add),
                        SizedBox(width: 40),
                        Text(Strings.myAds,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    UrlLauncher().openURL(Strings.appMakingAbout);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                            size: 40,
                            color: Color(0xff898888),
                            Icons.person_outline),
                        SizedBox(width: 40),
                        Text(Strings.aboutUs,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    UrlLauncher().openURL(Strings.appMakingContact);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                            size: 40,
                            color: Color(0xff898888),
                            Icons.contact_phone_outlined),
                        SizedBox(width: 40),
                        Text(Strings.contactUs,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
