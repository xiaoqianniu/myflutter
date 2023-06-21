import 'package:flutter/material.dart';

import 'AboutUs.dart';
import 'ContactUs.dart';
import 'main.dart';
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row (
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: "xiaowei")),
              );
            },
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUs()),
              );
            },
            child: const Text('About Us'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ContactUs()),
              );
            },
            child: const Text('Contact Us'),
          ),
        ]
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>   const Size.fromHeight(56.0);


}
