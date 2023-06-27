import 'package:flutter/material.dart';
import 'package:myflutter/ContactUs.dart';

import 'MainLayout.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: "About us",
        child: Text("we are MAP07, we are awsome")
    );
  }
}
