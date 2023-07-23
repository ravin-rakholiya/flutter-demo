import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:CanLi/service/api.dart';
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';

class practiceTest extends StatefulWidget {

  final List<dynamic> response;
  const practiceTest({Key? key, required this.response}) : super(key: key);

  @override
  _practiceTest createState() => _practiceTest();
}

class _practiceTest extends State<practiceTest> {
  String title = "";
  // List<int> questionNo = [];
  Map<int, bool> bookmark = {};
  Map<String, bool> selected = {};
  Map<String, bool> turnGreen = {};

  List<String> questions = [];

  List<String> options = [];

  List<String> answers = [];
  int index = 0;
  // bool selected = false;

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

  List generateNoOfOptions(int index) {
    List opt = widget.response[index]['option'].split(";");
    List<Padding> pd = [];
    debugPrint(opt.toString());

    for (int i = 0; i < opt.length; i++) {
      Padding wid = generateOption(opt[i]);
      pd.add(wid);
    }
    return pd;
  }

  Padding generateOption(String option) {
    var opt = option.trim();
    var opt_value = widget.response[index]['answer'].trim();
    if(opt[opt.length-1]=="."){
      opt = opt.trim().substring(0, opt.length - 1);
    }
    if(opt_value[opt_value.toString().length-1] == "."){
      opt_value = opt_value.trim().substring(0, opt_value.length - 1);
    }
    print(opt_value);
    print(opt);

    return Padding(
      padding: EdgeInsets.only(top: 24, left: 10, right: 10),
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Color(0XFF1D2749),
        shape: ((selected[option] == true) && (opt == opt_value)) ||
                (turnGreen[answers[index]] == true)
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.green, width: 6))
            : (selected[option] == true) && (opt != opt_value)
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.red, width: 6))
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            // debugPrint('Card tapped.');
            debugPrint(option);
            setState(() {
              if (selected[option] == null || false) {
                selected[option] = true;
                // turnGreen[answers[index]] = true;
              }
            });
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
    print("137-----------------");
    List<int> questionNo = [for (var i = 1; i <= widget.response.length; i++) i];
    questions = [for (var i = 1; i <= widget.response.length; i++) i.toString()];
    answers = [for (var i = 1; i <= widget.response.length; i++) i.toString()];
    options = [for (var i = 1; i <= widget.response.length; i++) i.toString()];

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
              height: MediaQuery.of(context).size.width + 192,
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
                  children: [
                    Column(
                      children: [
                        generateQuestion(index.toInt()),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                        ),
                        ...generateNoOfOptions(index),
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
                      padding: EdgeInsets.only(top: 30, left: 10),
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
                              debugPrint(bookmark[index].toString());
                              print("207========");
                              print(widget.response[index]['id']);
                              print(bookmark[index]);
                              if (bookmark[index] == null) {
                                bookmark[index] = true;
                                final postData = {
                                  'question_id': widget.response[index]['id'],
                                  'bookmark': "True",

                                };
                                networkAPICall().httpPostRequest(
                                    'api/v1/practice/bookmark/question',
                                    postData,
                                        (status, responseData) {
                                      if (status) {
                                        final mainJson =
                                        json.decode(responseData);
                                        String message =
                                        mainJson['response'];
                                        Fluttertoast.showToast(
                                            msg: message,
                                            toastLength:
                                            Toast.LENGTH_SHORT,
                                            gravity:
                                            ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                            Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);

                                      } else {
                                        print(responseData);
                                        var responseJson =
                                        json.decode(responseData);
                                        print(
                                            responseJson['message']);

                                        Fluttertoast.showToast(
                                            msg: responseJson[
                                            'error'],
                                            toastLength:
                                            Toast.LENGTH_SHORT,
                                            gravity:
                                            ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                            Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    });
                              } else if (bookmark[index] == false) {
                                bookmark[index] = true;

                                final postData = {
                                  'question_id': widget.response[index]['id'],
                                  'bookmark': "True",

                                };
                                networkAPICall().httpPostRequest(
                                    'api/v1/practice/bookmark/question',
                                    postData,
                                        (status, responseData) {
                                      if (status) {
                                        final mainJson =
                                        json.decode(responseData);
                                        String message =
                                        mainJson['response'];
                                        Fluttertoast.showToast(
                                            msg: message,
                                            toastLength:
                                            Toast.LENGTH_SHORT,
                                            gravity:
                                            ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                            Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);

                                      } else {
                                        print(responseData);
                                        var responseJson =
                                        json.decode(responseData);
                                        print(
                                            responseJson['message']);

                                        Fluttertoast.showToast(
                                            msg: responseJson[
                                            'error'],
                                            toastLength:
                                            Toast.LENGTH_SHORT,
                                            gravity:
                                            ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                            Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    });
                              } else {
                                bookmark[index] = false;
                                final postData = {
                                  'question_id': widget.response[index]['id'],
                                  'bookmark': "False",

                                };
                                networkAPICall().httpPostRequest(
                                    'api/v1/practice/bookmark/question',
                                    postData,
                                        (status, responseData) {
                                      if (status) {
                                        final mainJson =
                                        json.decode(responseData);
                                        String message =
                                        mainJson['response'];
                                        Fluttertoast.showToast(
                                            msg: message,
                                            toastLength:
                                            Toast.LENGTH_SHORT,
                                            gravity:
                                            ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                            Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);

                                      } else {
                                        print(responseData);
                                        var responseJson =
                                        json.decode(responseData);
                                        print(
                                            responseJson['error']);

                                        Fluttertoast.showToast(
                                            msg: responseJson[
                                            'error'],
                                            toastLength:
                                            Toast.LENGTH_SHORT,
                                            gravity:
                                            ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                            Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    });
                              }
                              // debugPrint(bookmark.toString());
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
                      padding: EdgeInsets.only(top: 45, right: 20),
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
                          elevation: 15,
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
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
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
