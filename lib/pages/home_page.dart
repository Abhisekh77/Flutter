import 'package:flutter/material.dart';
import 'package:my_first_project/pages/water_tank_page.dart';
import 'package:my_first_project/pages/weatherpage.dart';
import 'package:my_first_project/pages/water_usage.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final days = 30;
    final String name = "Abhi";
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(109, 184, 225, 1),
        child: Column(
          children: [
            AppBar(
              title: Text(
                "Home Page",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/water.png",
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WaterMeter1()),
                                );
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 5),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/consumption.png",
                                      width: 100,
                                      height: 100,
                                    ),
                                    Text(
                                      "Consumption",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WeatherPage()),
                                );
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 5),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/weather.png",
                                      width: 100,
                                      height: 100,
                                    ),
                                    Text(
                                      "Weather",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WeatherPage()),
                                );
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 5),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/esewa_logo.png",
                                      width: 100,
                                      height: 100,
                                    ),
                                    Text(
                                      "Payment",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WaterTank()),
                                );
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 5),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/tank.jpeg",
                                      width: 100,
                                      height: 100,
                                    ),
                                    Text(
                                      "Tank details",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
