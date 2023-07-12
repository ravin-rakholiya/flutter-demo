import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CanLi'),
        backgroundColor: const Color(0xFF1D2749),
      ),
      body: const Center(
        child: Text("Welcome to CanLi"),
      ),
    );
  }
}
