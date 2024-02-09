// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class WaterMeterdup extends StatefulWidget {
//   @override
//   _WaterMeterState createState() => _WaterMeterState();
// }

// class _WaterMeterState extends State<WaterMeterdup> {
//   int previousUnit = 0;
//   int todayUnit = 0;

//   @override
//   Widget build(BuildContext context) {
//     // ... Your existing build method

//     return Scaffold(
//       // ... Your existing scaffold setup
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _insertWaterMeterReading(),
//         tooltip: 'Insert Reading',
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   void _insertWaterMeterReading() async {
//     // You can replace this URL with the actual URL of your Node.js server
//     final url = Uri.parse('http://localhost:3001/api/watermeter');

//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'previousUnit': previousUnit,
//         'todayUnit': todayUnit,
//       }),
//     );

//     if (response.statusCode == 201) {
//       // Reading inserted successfully
//       print('Water meter reading inserted successfully');
//       // You can add any UI updates or navigation logic here
//     } else {
//       // Error inserting reading
//       print('Error inserting water meter reading');
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:my_first_project/models/waterbill.models.dart';

class WaterMeter extends StatefulWidget {
  final int previousUnit;
  final int todayUnit;

  const WaterMeter(
      {Key? key, required this.previousUnit, required this.todayUnit})
      : super(key: key);

  @override
  State<WaterMeter> createState() => _WaterMeterState();
}

class _WaterMeterState extends State<WaterMeter> {
  List<BillModel> billModel = [];

  @override
  Widget build(BuildContext context) {
    // Calculate total units and total price
    int totalUnits = widget.todayUnit - widget.previousUnit;
    int totalPrice = totalUnits * 5;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Water Meter",
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/water_meter.png'),
            // Text("Previous Unit: $previousUnit"),
            // Text("Today Unit: $todayUnit"),
            // Text("Total Units: $totalUnits"),
            // Text("Total Price: Rs. $totalPrice"),
            SizedBox(height: 20),
            _buildPriceTable(
                widget.previousUnit, widget.todayUnit, totalUnits, totalPrice),
          ],
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
        )),
        DataColumn(
            label: Text(
          'Value',
          style: TextStyle(
              color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
        )),
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
