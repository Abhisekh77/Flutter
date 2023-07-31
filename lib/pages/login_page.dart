import 'package:flutter/material.dart';
import 'package:my_first_project/utils/routes.dart';
import 'package:my_first_project/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //  formfield ko lagi hai
  final _formkey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  moveToHome(BuildContext context) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            child: Form(
      key: _formkey,
      child: Column(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  // obscureText ley password lai hide garxa, bydefault false hunxa
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 6) {
                      return "password length must exceed 6";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState?.validate() ?? false) {
                      // Proceed to the home page or any other action you want here
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  child: Text('Login'), // Add the child widget here
                  style: TextButton.styleFrom(minimumSize: Size(130, 40)),
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
