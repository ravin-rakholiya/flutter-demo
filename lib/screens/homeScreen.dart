import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:CanLi/service/api.dart';
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Example function for retrieving stored data
            final prefs = await SharedPreferences.getInstance();
            String? data = prefs.getString('dataKey');

            if (data != null) {
              Fluttertoast.showToast(msg: 'Data retrieved: $data');
            } else {
              Fluttertoast.showToast(msg: 'No data found.');
            }
          },
          child: const Text('Retrieve Data'),
        ),
      ),
    );
  }
}
