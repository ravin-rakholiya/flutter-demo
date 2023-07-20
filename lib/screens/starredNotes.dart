// import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

class starredNotesScreen extends StatefulWidget {
  const starredNotesScreen({Key? key}) : super(key: key);

  @override
  _starredNotesScreen createState() => _starredNotesScreen();
}

class _starredNotesScreen extends State<starredNotesScreen> {
  String temp = "";
  List<int> questionNo = [1, 2, 3, 4, 5];
  Map<int, bool> bookmark = {};
  // bool bookmark = false;

  List<String> notes = [
    "If a fully licensed driver is convicted of using a hand-held electronic device while driving, they will face which of the following penalties for a first offence?",
    "Do NOT park anywhere that you don't have a clear view for at least _____ metres in both directions.",
    "If you are found guilty of carrying a child passenger who is not properly secured, ____ demerit points will be added to your driving record.",
    "If you are found guilty of going the wrong way on a one-way road, ____ demerit points will be added to your driving record.",
    "If you are found guilty of backing on a highway or driving too slowly, ____ demerit points will be added to your driving record."
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

  Padding generateNotes(String note) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Text(
        note.toString(),
        textAlign: TextAlign.center,
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
        title: Text((notes[0] == "Nothing inside Bookmark page.") ? "".toString() : (questionNo[index]).toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),

        //Text((notes[0] == "Nothing inside Bookmark page.") ? "Nothing".toString() : ((questionNo[index]).toString(),
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //     ))),
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
              height: MediaQuery.of(context).size.width + 200,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            "Starred Notes",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // notes[index] != false ? generateNotes(notes[index].toString()) : generateNotes(notes[++index].toString()),
                        generateNotes(notes[index].toString())

                        // Padding(
                        //   padding: EdgeInsets.only(top: 50),
                        // ),
                        // generateOption(answers[index].toString()),
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
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Container(
                          child: TextButton(
                            //True if this widget will be selected as the initial focus when no other node in its scope is currently focused.
                            autofocus: true,
                            //Called when the button is tapped or otherwise activated.
                            onPressed: () {
                              setState(() {
                                // bookmark = true;
                                // bookmark[index] = false;
                                try {
                                  if (notes.length > 1) {
                                    notes.remove(notes[index]);
                                    debugPrint(notes.toString());
                                  }
                                  if (notes.length == 1) {
                                    notes = ["Nothing inside Bookmark page."];
                                  }
                                } catch (e) {
                                  debugPrint(e.toString());
                                }
                                debugPrint(bookmark.toString());
                              });
                            },
                            //Customizes this button's appearance
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Color(0XFF1D2749),
                                onSurface: Colors.indigo,
                                shadowColor: Colors.indigo,
                                elevation: 5,
                                side: const BorderSide(
                                    color: Colors.indigo, width: 1),
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
                                Container(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Icon(Icons.bookmark_remove, size: 24),
                                        Text(
                                          'Remove',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),

                    // ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Text(""),
                  // ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      iconSize: 48,
                      padding: EdgeInsets.only(top: 50, right: 5),
                      alignment: Alignment.centerRight,
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        setState(() {
                          if (index < notes.length - 1) {
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
