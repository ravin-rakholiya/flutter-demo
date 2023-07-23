import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:CanLi/service/api.dart';
import 'dart:convert' show json;

class moduleBasedLearningScreens extends StatefulWidget {
  final List<dynamic> response;
  const moduleBasedLearningScreens({Key? key, required this.response}) : super(key: key);

  @override
  _moduleBasedLearningScreens createState() => _moduleBasedLearningScreens();
}

class _moduleBasedLearningScreens extends State<moduleBasedLearningScreens> {


  String title = "";
  // List<int> questionNo = [1, 2, 3, 4, 5];
  Map<int, bool> bookmark = {};
  // bool bookmark = false;

  List<String> questions = [];

  List<String> answers = [];

  int index = 0;

  Padding generateQuestion(int index) {
    if (widget.response[index]['question_type']=="sign"){
      String contentURL = widget.response[index]['content']['content'];
      return Padding(
          padding: EdgeInsets.only(top: 50, left: 10),
          child: Image.network(contentURL)
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 50, left: 10),
      child: Text(
        widget.response[index]['question'],
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
      ),
    );
  }

  Padding generateOption(int index) {
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
                      widget.response[index]['answer'],
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
    questions = [for (var i = 1; i <= widget.response.length; i++) i.toString()];
    answers = [for (var i = 1; i <= widget.response.length; i++) i.toString()];
    List<int> questionNo = [for (var i = 1; i <= widget.response.length; i++) i];
    print(questionNo);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text((questions[0] == "Nothing inside Bookmark page.") ? "".toString() : (questionNo[index]).toString(),
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
              height: MediaQuery.of(context).size.width + 180,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 50),
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
                        generateQuestion(index),
                        Padding(
                          padding: EdgeInsets.only(bottom: 150),
                        ),
                        if (answers[0] != "") generateOption(index),
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
                    child: IconButton(
                      iconSize: 48,
                      padding: EdgeInsets.only(top: 50, left: 20),
                      alignment: Alignment.centerLeft,
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        setState(() {
                          if (index > 0) {
                            index--;
                          } else {
                            index = 0;
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      iconSize: 48,
                      padding: EdgeInsets.only(top: 50, right: 5),
                      alignment: Alignment.centerRight,
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        setState(() {
                          if (index < questions.length - 1) {
                            index++;
                          } else {
                            index = 0;
                          }
                        });
                      },
                    ),
                  )
                ],
              ),
            )
          ])),
    );
  }
}
