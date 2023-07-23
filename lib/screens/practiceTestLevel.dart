import 'package:CanLi/screens/edit_profile.dart';
import 'package:CanLi/screens/homeScreen.dart';
import 'package:CanLi/screens/practiceTest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CanLi/screens/signup.dart';
import 'package:CanLi/screens/progressBar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:CanLi/service/api.dart';
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:CanLi/screens/PT_list.dart';
class practiceTestLevel extends StatelessWidget {
  const practiceTestLevel({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.indigo,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const HomeScreen()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text("Practice Test Level",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(29, 39, 73, 1),
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height + 151,
                margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                decoration: BoxDecoration(
                    // color: Colors.purple,
                    color: Color(0xFFF2F2FA),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100))),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 105, 20, 10),
                      height: 95,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset:
                                  Offset(4, -3), // changes position of shadow
                            ),
                          ],
                          color: Color.fromRGBO(29, 39, 73, 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Container(
                            height: 95,
                            width: MediaQuery.of(context).size.width - 120,
                            child: OutlinedButton(
                              child: Text("EASY"),
                              style: OutlinedButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w900),
                                padding: EdgeInsets.fromLTRB(50, 0, 10, 0),
                                alignment: Alignment.centerLeft,
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromRGBO(29, 39, 73, 1),
                                shape: const StadiumBorder(),
                                side: BorderSide(color: Colors.transparent),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => pt_list(
                                          test_type: 'easy')),
                                );
                              },
                            ),
                          ),
                          Container(
                            child: Image.asset("images/logo/easy.png"),
                            width: 80,
                            height: 90,
                            padding: EdgeInsets.fromLTRB(0, 0, 7, 0),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 30, 20, 10),
                      height: 95,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade900),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellowAccent.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset:
                                  Offset(4, -3), // changes position of shadow
                            ),
                          ],
                          color: Color.fromRGBO(29, 39, 73, 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Container(
                            height: 95,
                            width: MediaQuery.of(context).size.width - 120,
                            child: OutlinedButton(
                              child: Text("MEDIUM"),
                              style: OutlinedButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w900),
                                padding: EdgeInsets.fromLTRB(50, 0, 10, 0),
                                alignment: Alignment.centerLeft,
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromRGBO(29, 39, 73, 1),
                                shape: const StadiumBorder(),
                                side: BorderSide(color: Colors.transparent),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => pt_list(
                                          test_type: 'medium')),
                                );
                              },
                            ),
                          ),
                          Container(
                            child: Image.asset("images/logo/med.png"),
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 30, 20, 10),
                      height: 95,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.redAccent),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.redAccent.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset:
                                  Offset(4, -3), // changes position of shadow
                            ),
                          ],
                          color: Color.fromRGBO(29, 39, 73, 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Container(
                            height: 95,
                            width: MediaQuery.of(context).size.width - 120,
                            child: OutlinedButton(
                              child: Text("HARD"),
                              style: OutlinedButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w900),
                                padding: EdgeInsets.fromLTRB(50, 0, 10, 0),
                                alignment: Alignment.centerLeft,
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromRGBO(29, 39, 73, 1),
                                shape: const StadiumBorder(),
                                side: BorderSide(color: Colors.transparent),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => pt_list(
                                          test_type: 'hard')),
                                );
                              },
                            ),
                          ),
                          Container(
                            child: Image.asset("images/logo/hard.png"),
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
