import 'package:flutter/material.dart';
import 'package:myflutter/ContactUs.dart';

import 'BottomBar.dart';
import 'MainLayout.dart';
import 'NavBar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: "About us",
        child: Scaffold(
            appBar: AppBar(
              title: const Text('About us'),
            ),
            body: Center(
              child: ElevatedButton(
                child: const Text('Contact us'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactUs()),
                  );
                },
              ),
            )));
  }
}
