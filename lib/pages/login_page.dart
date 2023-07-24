import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black,
        child: Scaffold(
            body: Column(
          children: [
            Image.asset(
              "assets/login_image.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Welcome to Login Page",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              // padding: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                  ),
                  TextFormField(
                    // obscureText ley password lai hide garxa, bydefault false hunxa
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Hello abhi");
                    },
                    child: Text("Login"),
                  )
                ],
              ),
            ),
          ],
        )));
  }
}
