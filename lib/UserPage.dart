import 'package:flutter/material.dart';
import 'package:myflutter/MainLayout.dart';
import 'package:provider/provider.dart';

import 'DisplayUserCard.dart';
import 'model/Profile.dart';
import 'model/ProfileRepository.dart';
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: "Display User",
        child: FutureBuilder<Profile>(
            future: Provider.of<ProfileRepository>(context, listen: false)
                .getFixedUser(),
            builder: (context, AsyncSnapshot<Profile> user) {
              if (!user.hasData) {
                return CircularProgressIndicator();
              } else if (user.data!.isNoUser()) {
                return Text("User not found");
              }
              else {
                return DisplayUserCard(user: user.data!);
              }
            }));
  }
}
