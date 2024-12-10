// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class CarSelectionWidget extends StatefulWidget {
//   final Function(String make, String model) onSelectionComplete;
//
//   const CarSelectionWidget({Key? key, required this.onSelectionComplete})
//       : super(key: key);
//
//   @override
//   _CarSelectionWidgetState createState() => _CarSelectionWidgetState();
// }
//
// class _CarSelectionWidgetState extends State<CarSelectionWidget> {
//   String? selectedMake;
//   String? selectedModel;
//
//   List<String> carMakes = [];
//   List<String> carModels = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchCarMakes();
//   }
//
//   Future<void> fetchCarMakes() async {
//     final url =
//     Uri.parse('https://parseapi.back4app.com/classes/Car_Model_List?limit=1000');
//
//     try {
//       final response = await http.get(
//         url,
//         headers: {
//           "X-Parse-Application-Id": "hlhoNKjOvEhqzcVAJ1lxjicJLZNVv36GdbboZj3Z",
//           "X-Parse-Master-Key": "SNMJJF0CZZhTPhLDIqGhTlUNV9r60M2Z5spyWfXW",
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final results = data['results'] as List;
//
//         setState(() {
//           carMakes = results
//               .map((e) => e['Make'] as String)
//               .toSet()
//               .toList(); // Unique makes
//         });
//       } else {
//         _showError('Failed to fetch car makes: ${response.statusCode}');
//       }
//     } catch (e) {
//       _showError('An error occurred: $e');
//     }
//   }
//
//   Future<void> fetchCarModels(String make) async {
//     final where = Uri.encodeQueryComponent(jsonEncode({"Make": make}));
//     final url =
//     Uri.parse('https://parseapi.back4app.com/classes/Car_Model_List?limit=1000&where=$where');
//
//     try {
//       final response = await http.get(
//         url,
//         headers: {
//           "X-Parse-Application-Id": "hlhoNKjOvEhqzcVAJ1lxjicJLZNVv36GdbboZj3Z",
//           "X-Parse-Master-Key": "SNMJJF0CZZhTPhLDIqGhTlUNV9r60M2Z5spyWfXW",
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final results = data['results'] as List;
//
//         setState(() {
//           carModels = results
//               .map((e) => e['Model'] as String)
//               .toSet()
//               .toList(); // Unique models
//         });
//       } else {
//         _showError('Failed to fetch car models: ${response.statusCode}');
//       }
//     } catch (e) {
//       _showError('An error occurred: $e');
//     }
//   }
//
//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Dropdown for Makes
//         DropdownButton<String>(
//           hint: const Text('Select Make'),
//           value: selectedMake,
//           onChanged: (newValue) {
//             setState(() {
//               selectedMake = newValue;
//               selectedModel = null; // Reset the model when make changes
//               carModels.clear();    // Clear models for the new make
//             });
//             fetchCarModels(newValue!); // Fetch models for the selected make
//           },
//           items: carMakes.map((make) {
//             return DropdownMenuItem(
//               value: make,
//               child: Text(make),
//             );
//           }).toList(),
//         ),
//         // Dropdown for Models
//         if (selectedMake != null)
//           DropdownButton<String>(
//             hint: const Text('Select Model'),
//             value: selectedModel,
//             onChanged: (newValue) {
//               setState(() {
//                 selectedModel = newValue;
//               });
//             },
//             items: carModels.map((model) {
//               return DropdownMenuItem(
//                 value: model,
//                 child: Text(model),
//               );
//             }).toList(),
//           ),
//
//       ],
//     );
//   }
// }
