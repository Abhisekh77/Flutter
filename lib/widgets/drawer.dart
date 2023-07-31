import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePath = "abhi1.png";
    return Drawer(
      width: 250,
      child: Container(
        color: Colors.purple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text('Abhisekh Khanal'),
                accountEmail: Text("avishekkhanal750@gmail.com"),
                currentAccountPicture: Image.asset(
                  "assets/abhi1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // to add icons like home.....
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text("Home Page", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.my_location, color: Colors.white),
              title: Text("My Profile", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.search, color: Colors.white),
              title: Text("Search here", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.white),
              title: Text("Email me", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
