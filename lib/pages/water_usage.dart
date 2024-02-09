// import 'package:flutter/material.dart';

// class WaterMeter extends StatelessWidget {
//   const WaterMeter({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Water Meter"),
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               Image.asset('assets/water_meter.png'),
//               Text("Previous Unit"),
//               Text("Today Unit"),
//               Text("Total Units"),
//               Text("Total Price")
//             ],
//           ),
//         ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:my_first_project/models/waterbill.models.dart';

// class WaterMeter1 extends StatefulWidget {
//   final int previousUnit;
//   final int todayUnit;

//   const WaterMeter1(
//       {Key? key, required this.previousUnit, required this.todayUnit})
//       : super(key: key);

//   @override
//   State<WaterMeter1> createState() => _WaterMeter1State();
// }

// class _WaterMeter1State extends State<WaterMeter1> {
//   @override
//   Widget build(BuildContext context) {
//     // Calculate total units and total price
//     int totalUnits = widget.todayUnit - widget.previousUnit;
//     int totalPrice = totalUnits * 5;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Water Meter",
//           style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Image.asset('assets/water_meter.png'),
//             SizedBox(height: 20),
//             _buildPriceTable(
//                 widget.previousUnit, widget.todayUnit, totalUnits, totalPrice),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPriceTable(
//       int previousUnit, int todayUnit, int totalUnits, int totalPrice) {
//     return DataTable(
//       columns: const <DataColumn>[
//         DataColumn(
//             label: Text(
//           'Description',
//           style: TextStyle(
//               color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
//         )),
//         DataColumn(
//             label: Text(
//           'Value',
//           style: TextStyle(
//               color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
//         )),
//       ],
//       rows: <DataRow>[
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text(
//               'Previous Unit',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             )),
//             DataCell(Text(previousUnit.toString())),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text(
//               'Today Unit',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             )),
//             DataCell(Text(todayUnit.toString())),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text(
//               'Total Units',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             )),
//             DataCell(Text(totalUnits.toString())),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text(
//               'Total Price',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             )),
//             DataCell(Text('Rs. $totalPrice')),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WaterMeter1 extends StatefulWidget {
  @override
  State<WaterMeter1> createState() => _WaterMeter1State();
}

class _WaterMeter1State extends State<WaterMeter1> {
  late Future<List<BillModel>> futureBill;

  @override
  void initState() {
    super.initState();
    // Call the function to fetch data when the widget is initialized
    futureBill = fetchBill();
  }

  // Function to fetch data from the API
  Future<List<BillModel>> fetchBill() async {
    final response = await http.get(
      Uri.parse('https://watermeterbackend.vercel.app/api/bill'),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      List<dynamic> data = json.decode(response.body)['myData'];
      List<BillModel> bills =
          data.map((json) => BillModel.fromJson(json)).toList();
      return bills;
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load bill data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Water Meter",
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<BillModel>>(
          future: futureBill,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              // Display details of the latest bill entry
              BillModel latestBill = snapshot.data!.first;

              return Column(
                children: [
                  Image.asset('assets/water_meter.png'),
                  SizedBox(height: 20),
                  _buildPriceTable(
                    latestBill.previousUnit,
                    latestBill.currentUnit,
                    latestBill.totalUnit,
                    latestBill.totalPrice,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              // There was an error fetching the data
              return Text("Error: ${snapshot.error}");
            }

            // Data is still loading
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget _buildPriceTable(
      int previousUnit, int todayUnit, int totalUnits, int totalPrice) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Description',
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Value',
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              'Previous Unit',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            DataCell(Text(previousUnit.toString())),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              'Today Unit',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            DataCell(Text(todayUnit.toString())),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              'Total Units',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            DataCell(Text(totalUnits.toString())),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              'Total Price',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            DataCell(Text('Rs. $totalPrice')),
          ],
        ),
      ],
    );
  }
}

class BillModel {
  final String id;
  final int previousUnit;
  final int currentUnit;
  final int totalUnit;
  final int totalPrice;

  BillModel({
    required this.id,
    required this.previousUnit,
    required this.currentUnit,
    required this.totalUnit,
    required this.totalPrice,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
        id: json["_id"],
        previousUnit: json["PreviousUnit"],
        currentUnit: json["CurrentUnit"],
        totalUnit: json["TotalUnit"],
        totalPrice: json["TotalPrice"],
      );
}
