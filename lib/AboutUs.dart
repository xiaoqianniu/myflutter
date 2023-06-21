import 'package:flutter/material.dart';
import 'package:myflutter/ContactUs.dart';

import 'BottomBar.dart';
import 'NavBar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),

      body: Center(
        child:
          ElevatedButton(
          child: const Text('ContactUs'),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ContactUs()),
            );
          },
        ),

      ),
        // bottomNavigationBar: const BottomBar()
    );
  }
}
