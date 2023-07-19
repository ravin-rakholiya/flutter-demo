import 'dart:async';

import 'package:flutter/material.dart';

/// Flutter code sample for [LinearProgressIndicator].

void main() => runApp(const ProgressIndicatorApp());
double initial = 0.5;

class ProgressIndicatorApp extends StatelessWidget {
  const ProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProgressIndicatorExample(),
    );
  }
}

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget _stepIndicator() {
    int value = 50;
    return Column(
      children: [
        Text(
          "$value% progress achieved",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
            // fontFamily: GoogleFonts.lato().fontFamily,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
                height: 20,
                child: LinearProgressIndicator(
                  value: initial,
                  semanticsLabel: 'Linear progress indicator',
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Colors.indigo),
                  minHeight: 30,
                  // valueColor: AlwaysStoppedAnimation<Color>(Colors.amber,),
                ))),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // const Text(
            //   'Linear progress indicator with a fixed color',
            //   style: TextStyle(fontSize: 20),
            // ),
            // LinearProgressIndicator(
            //   value: initial,
            //   semanticsLabel: 'Linear progress indicator',
            //   backgroundColor: Colors.white,
            //   valueColor: AlwaysStoppedAnimation(Colors.indigo),
            //   minHeight: 30,
            //   // valueColor: AlwaysStoppedAnimation<Color>(Colors.amber,),
            // ),
            _stepIndicator(),
          ],
        ),
      ),
    );
  }
}
