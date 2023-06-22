import 'package:flutter/material.dart';
import 'BottomBar.dart';
import 'NavBar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.title, this.child});
  final String title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        const NavBar(),
        backgroundColor: Colors.blue,

      body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              child ?? Container(),
              const SizedBox(height: 20),
              // const BottomBar(),
            ],
          ),
      ),
    );
  }
}
