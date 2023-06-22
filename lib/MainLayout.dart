import 'package:flutter/material.dart';
import 'NavBar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.title, this.child});
  final String title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
         NavBar(),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue,

      body: Center(
          child: child

      ),
    );
  }
}
