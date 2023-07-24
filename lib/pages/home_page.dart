import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final days = 30;
    final String name = "Abhi";
    return Scaffold(
      appBar: AppBar(
        title: Text("ABCDE App"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/login_image.png"),
            Container(
              child: Text("Welcome to $days days of Flutter by $name Khanal"),
            ),
            Image.asset(
              "assets/login_image.png",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      drawer: Drawer(),
      //  appbar ma aaune tripleline wala drawer vaneko
    );
  }
}
