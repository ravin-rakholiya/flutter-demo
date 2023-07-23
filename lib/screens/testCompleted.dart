import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

class testCompleted extends StatefulWidget {
  const testCompleted({Key? key}) : super(key: key);

  @override
  State<testCompleted> createState() => _testCompleted();
}

class _testCompleted extends State<testCompleted>
    with TickerProviderStateMixin {
  late AnimationController controller;
  double progress = 0;
  double correct = 0;
  double incorrect = 0;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
      setState(() {
        correct = 11;
        incorrect = 29;
        progress = correct / (correct + incorrect);
      });
    });
    controller.repeat(reverse: false);
    // controller.repeat(min: 1);
    // controller.repeat(max: 1, min: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Practice Test Score",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Color(0XFF1D2749),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Material(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width + 245,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2FA),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: SizedBox(
                        // padding: EdgeInsets.only(top: 50),
                        height: 200,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 200,
                                width: 200,
                                child: new CircularProgressIndicator(
                                  strokeWidth: 15,
                                  value: progress,
                                  color: Colors.green,
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                            // Center(
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      (progress * 100).floor().toString() + "%",
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // ),
                                    Text(
                                      correct.toString() + " correct",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      incorrect.toString() + " incorrect",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 100, left: 0),
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                progress >= 0.8
                                    ? "Congratulations !"
                                    : "Not Enough To Pass !",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.lato().fontFamily,
                                ),
                              ),
                              // Center(
                              // child:
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(left: 50.0),
                                      child: Text(
                                        progress >= 0.8
                                            ? "You have successfully passed the test and proceed with next test !"
                                            : "Try to go through learning modules and try again !",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontFamily:
                                          GoogleFonts.lato().fontFamily,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset(progress >= 0.8
                                        ? "images/logo/passed_emogy.png"
                                        : "images/logo/try_again_emogy.png"),
                                  ),
                                ],
                              ),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // Text("data"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: TextButton(
                //True if this widget will be selected as the initial focus when no other node in its scope is currently focused.
                autofocus: true,
                //Called when the button is tapped or otherwise activated.
                onPressed: () {
                  // ignore: avoid_print
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //           const OTPVerification()),
                  // );
                },
                //Customizes this button's appearance
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.indigo,
                    onSurface: Colors.indigo,
                    shadowColor: Colors.indigo,
                    elevation: 5,
                    side: const BorderSide(color: Colors.indigo, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    textStyle: const TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                    )),

                //Typically the button's label.
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    // SizedBox(width: 22),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Text(
                        'Go to Learning Modules',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
