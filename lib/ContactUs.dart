import 'package:flutter/material.dart';
import 'package:myflutter/main.dart';

import 'NavBar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: Center(
        child: ElevatedButton(
          child: const Text('Home'),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: "Home")),
            );
          },
        ),
      ),

    );
  }
}





