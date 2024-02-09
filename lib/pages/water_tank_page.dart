import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WaterTank extends StatefulWidget {
  const WaterTank({Key? key}) : super(key: key);

  @override
  State<WaterTank> createState() => _WaterTankState();
}

class _WaterTankState extends State<WaterTank> {
  late List<WaterTankData> waterTankDataList;

  @override
  void initState() {
    super.initState();
    waterTankDataList = [];
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://majorproject-git-main-alex5748s-projects.vercel.app/get-data'));

    if (response.statusCode == 200) {
      print(response.body); // Debug print statement
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        waterTankDataList =
            data.map((item) => WaterTankData.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Tank'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text("Rain Water Tank"),
              Image.asset(
                "assets/rainwatertank.jpeg",
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Container(
                height: 130,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    DataTable(
                      columnSpacing: 20,
                      columns: [
                        DataColumn(label: Text("ID")),
                        DataColumn(label: Text("Tank")),
                        DataColumn(label: Text("Available water")),
                      ],
                      rows: waterTankDataList
                              ?.where((data) => data.tank == "A")
                              .take(1)
                              .map(
                            (data) {
                              return DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text("B")),
                                DataCell(
                                    Text(data.waterLevelOfRainTank.toString())),
                              ]);
                            },
                          ).toList() ??
                          [],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Normal Water Tank"),
              SizedBox(height: 20),
              Image.asset(
                "assets/watertank1.jpg",
                width: 400,
                height: 170,
              ),
              Container(
                height: 180,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    DataTable(
                      columnSpacing: 20,
                      columns: [
                        DataColumn(label: Text("ID")),
                        DataColumn(label: Text("Tank")),
                        DataColumn(label: Text("Available water")),
                      ],
                      rows: waterTankDataList
                              ?.where((data) => data.tank == "A")
                              .take(1)
                              .map(
                            (data) {
                              return DataRow(cells: [
                                DataCell(Text("1")),
                                DataCell(Text(data.tank)),
                                DataCell(
                                    Text(data.waterLevelNormalTank.toString())),
                              ]);
                            },
                          ).toList() ??
                          [],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class WaterTankData {
  final String id;
  final String tank;
  final int waterLevelOfRainTank;
  final int waterLevelNormalTank;

  WaterTankData({
    required this.id,
    required this.tank,
    required this.waterLevelOfRainTank,
    required this.waterLevelNormalTank,
  });

  factory WaterTankData.fromJson(Map<String, dynamic> json) {
    return WaterTankData(
      id: json['_id'],
      tank: 'A', // Assuming tank A is associated with 'Water level normal tank'
      waterLevelOfRainTank: json['Water level rain tank'] ?? 0,
      waterLevelNormalTank: json['Water level of normal tank'] ?? 0,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WaterTank(),
  ));
}
