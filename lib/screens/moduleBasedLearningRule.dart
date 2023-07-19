import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

class moduleBasedLearningRule extends StatefulWidget {
  const moduleBasedLearningRule({Key? key}) : super(key: key);

  @override
  _moduleBasedLearningRule createState() => _moduleBasedLearningRule();
}

class _moduleBasedLearningRule extends State<moduleBasedLearningRule> {
  String title = "";
  List<int> questionNo = [1, 2, 3, 4, 5];
  Map<int, bool> bookmark = {};
  // bool bookmark = false;
  String responseexample = "";

  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "http://3.129.218.153:8000/api/v1/practice/fetch/questionbank?question_type=sign"));
    debugger();
    if (response.statusCode == 200) {
      setState(() {
        debugger();
        responseexample = response.body;
      });
    }
  }

  void initState() {
    apicall();
    super.initState();
  }

  List<String> questions = [
    "If a fully licensed driver is convicted of using a hand-held electronic device while driving, they will face which of the following penalties for a first offence?",
    "Do NOT park anywhere that you don't have a clear view for at least _____ metres in both directions.",
    "If you are found guilty of carrying a child passenger who is not properly secured, ____ demerit points will be added to your driving record.",
    "If you are found guilty of going the wrong way on a one-way road, ____ demerit points will be added to your driving record.",
    "If you are found guilty of backing on a highway or driving too slowly, ____ demerit points will be added to your driving record."
  ];

  List<String> answers = [
    "A fine of up to 1000 dollar and 3 demerit points",
    "125",
    "2",
    "3",
    "2"
  ];
  int index = 0;

  Padding generateQuestion(String question) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 10),
      child: Text(
        question.toString(),
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
      ),
    );
  }

  Padding generateOption(String option) {
    return Padding(
      padding: EdgeInsets.only(top: 24, left: 10, right: 10),
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Color(0XFF1D2749),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 60,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      option.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text((questionNo[index]).toString(),
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
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width + 245,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2FA),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        generateQuestion(questions[index].toString()),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                        ),
                        generateOption(answers[index].toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                // padding: EdgeInsets.only(top: 24, left: 0),
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: 36, left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(
                            bookmark[index] == true
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: Color(0xFF192A4F),
                            size: 48,
                          ),
                          onPressed: () {
                            setState(() {
                              // bookmark = true;
                              bookmark[index] = true;
                              debugPrint(bookmark.toString());
                            });
                          },
                          color: Color(0xFF192A4F),
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Text(""),
                  // ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: 60, right: 20),
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
                          //       const HomeScreen()),
                          // );
                          setState(() {
                            if (index < 4) {
                              index++;
                            } else {
                              index = 0;
                            }
                          });
                        },
                        //Customizes this button's appearance
                        style: TextButton.styleFrom(
                          // primary: Colors.white,
                          backgroundColor: Color(0XFF1D2749),
                          onSurface: Colors.indigo,
                          shadowColor: Colors.indigo,
                          elevation: 5,
                          side:
                          const BorderSide(color: Colors.indigo, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                          textStyle: const TextStyle(
                            color: Color(0XFF1D2749),
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                          ),
                        ),

                        //Typically the button's label.
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: const Text("Next Question",
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                // height: 1,
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ])),
    );
  }
}
