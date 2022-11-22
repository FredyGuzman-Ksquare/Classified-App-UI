import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/circularProgressIndicator.dart';
import 'package:flutter_project/services/profile.dart';

import '../utils/alert_manager.dart';
import '../utils/strings.dart';

class CustomCircleAvatar {
  customProfileAvatar(context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/settings', arguments: {});
        },
        child: FutureBuilder(
          future: ProfileService().myUserPost(),
          builder: (((context, snapshot) {
            if (snapshot.hasData) {
              Map userData = snapshot.data!;
              return CircleAvatar(
                backgroundImage: NetworkImage(userData['imgURL']),
                radius: 16,
              );
            }
            if (snapshot.hasError) {
              return AlertManager()
                  .displaySnackbar(context, "Something went wrong.");
            }
            return CustomCircularProgress().customBlackCPI();
          })),
        ));
  }
}
