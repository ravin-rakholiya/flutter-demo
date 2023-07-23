import 'package:flutter/material.dart';
import 'package:CanLi/screens/edit_profile.dart';
import 'package:CanLi/screens/moduleBasedLearningRule.dart';
import 'package:CanLi/screens/practiceTest.dart';
import 'package:CanLi/screens/practiceTestLevel.dart';
import 'package:CanLi/screens/bookMarkedQuestions.dart';
import 'package:flutter/services.dart';
import 'package:CanLi/screens/signup.dart';
import 'package:CanLi/screens/profile.dart';
import 'package:CanLi/screens/progressBar.dart';
import 'package:CanLi/screens/starredNotes.dart';
import 'package:CanLi/screens/moduleBasedLearningHome.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:CanLi/service/api.dart';
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  final int value;
  const HomeScreen({super.key,required this.value});

  addStringToSF(
      String email,
      int user_id,
      String full_name,
      String location_city,
      String test_date,
      String dob,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("31----------");
    print(user_id);
    prefs.setString('email', email);
    prefs.setInt('user_id', user_id);
    prefs.setString('full_name', full_name);
    prefs.setString('location_city', location_city);
    prefs.setString('test_date', test_date);
    prefs.setString('dob', dob);
  }
  @override
  Widget _stepIndicator(BuildContext context) {
    String? _email = '';
    String? _full_name = '';
    String? _location_city = '';
    String? _test_date = '';
    String? _dob = '';




    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(29, 39, 73, 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              // container for text - can be kept out of previous container
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "$value% progress achieved",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    // fontFamily: GoogleFonts.lato().fontFamily,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width - 50,
                        child: LinearProgressIndicator(
                          value: value/100,
                          semanticsLabel: 'Linear progress indicator',
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation(Colors.deepPurpleAccent),
                          minHeight: 30,
                          // valueColor: AlwaysStoppedAnimation<Color>(Colors.amber,),
                        ))),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(29, 39, 73, 1),
          elevation: 1,
          leading: Image.asset(
            "images/logo/CanLi_logo.png",
            // alignment: Alignment.center,
            height: 100,
            width: 1,
          ),
          title: Text("CANLI"),
          titleTextStyle: TextStyle(fontSize: 26, color: Colors.white),
          leadingWidth: 70,
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              iconSize: 40,
              onPressed: () {
                networkAPICall().httpGetRequest(
                    'api/v1/user/edit/profile',
                        (status, responseData) {
                      if (status) {
                        final mainJson = json.decode(responseData);
                        var response = mainJson['response'];
                        int user_id = response['id'];
                        String full_name = response['full_name'];
                        String dob = response['dob'];
                        String location_city = response['location_city'];
                        String test_date = response['test_date'];
                        String username = response['username'];
                        print(response);
                         addStringToSF(username, user_id, full_name, location_city, test_date, dob);
                        print(mainJson);
                      } else {
                        print(responseData);
                        var responseJson =
                        json.decode(responseData);
                        print(
                            responseJson['message']);


                      }
                    });
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ProfileScreen()));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          // color: Colors.white,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width - 220,
                child: Column(
                  children: <Widget>[
                    _stepIndicator(context),
                  ],
                ),
              ),
              // -------------------------------------
              //  Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                    color: Color(0xFFF2F2FA),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100))),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 85, 20, 10),
                      height: 65,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(29, 39, 73, 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Container(
                            height: 65,
                            width: MediaQuery.of(context).size.width - 130,
                            child: OutlinedButton(
                              child: Text("Bookmark Question Bank"),
                              style: OutlinedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 17),
                                padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
                                alignment: Alignment.centerLeft,
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromRGBO(29, 39, 73, 1),
                                shape: const StadiumBorder(),
                                side: BorderSide(color: Colors.transparent),
                              ),
                              onPressed: () {
                                networkAPICall().httpGetRequest(
                                    'api/v1/practice/bookmark/question',
                                        (status, responseData) {
                                      if (status) {
                                        final mainJson = json.decode(responseData);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  bookmarkQuestionScreen(response:mainJson['response'])),
                                        );
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
                              },
                            ),
                          ),
                          Container(
                            child: OutlinedButton(
                              child: Image.asset(
                                  "images/logo/bookmark question.png"),
                              style: OutlinedButton.styleFrom(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  backgroundColor:
                                      Color.fromRGBO(29, 39, 73, 1),
                                  shape: const StadiumBorder(),
                                  side: BorderSide(color: Colors.transparent)),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => editProfile()),
                                // );
                              },
                            ),
                          )
                        ],
                      ),
                      // ),
                      // color: Colors.orange,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                      height: 65,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(29, 39, 73, 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Container(
                            height: 65,
                            width: MediaQuery.of(context).size.width - 130,
                            child: OutlinedButton(
                              child: Text("Practise Test"),
                              style: OutlinedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 17),
                                padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
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
                                      builder: (context) =>
                                          practiceTestLevel()),
                                );
                              },
                            ),
                          ),
                          Container(
                            child: OutlinedButton(
                              child:
                                  Image.asset("images/logo/practise test.png"),
                              style: OutlinedButton.styleFrom(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  backgroundColor:
                                      Color.fromRGBO(29, 39, 73, 1),
                                  shape: const StadiumBorder(),
                                  side: BorderSide(color: Colors.transparent)),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           ProgressIndicatorApp()),
                                // );
                              },
                            ),
                          )
                        ],
                      ),
                      // ),
                      // color: Colors.orange,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                      height: 65,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(29, 39, 73, 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Container(
                            height: 65,
                            width: MediaQuery.of(context).size.width - 130,
                            child: OutlinedButton(
                              child: Text("Module Based Learning"),
                              style: OutlinedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 17),
                                padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
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
                                      builder: (context) =>
                                          moduleBasedLearningHome()),
                                );
                              },
                            ),
                          ),
                          Container(
                            child: OutlinedButton(
                              child:
                                  Image.asset("images/logo/module based.png"),
                              style: OutlinedButton.styleFrom(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.fromLTRB(8, 6, 0, 5),
                                  backgroundColor:
                                      Color.fromRGBO(29, 39, 73, 1),
                                  shape: const StadiumBorder(),
                                  side: BorderSide(color: Colors.transparent)),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           ProgressIndicatorApp()),
                                // );
                              },
                            ),
                          )
                        ],
                      ),
                      // ),
                      // color: Colors.orange,
                    ),
                    // Container(
                    //   margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                    //   height: 65,
                    //   width: MediaQuery.of(context).size.width - 20,
                    //   decoration: BoxDecoration(
                    //       color: Color.fromRGBO(29, 39, 73, 1),
                    //       borderRadius: BorderRadius.circular(25)),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         height: 65,
                    //         width: MediaQuery.of(context).size.width - 130,
                    //         child: OutlinedButton(
                    //           child: Text("Stared Notes"),
                    //           style: OutlinedButton.styleFrom(
                    //             textStyle: TextStyle(fontSize: 17),
                    //             padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
                    //             alignment: Alignment.centerLeft,
                    //             foregroundColor: Colors.white,
                    //             backgroundColor: Color.fromRGBO(29, 39, 73, 1),
                    //             shape: const StadiumBorder(),
                    //             side: BorderSide(color: Colors.transparent),
                    //           ),
                    //           onPressed: () {
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       starredNotesScreen()),
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //       Container(
                    //         child: OutlinedButton(
                    //           child: Image.asset(
                    //               "images/logo/bookmarked notes.png"),
                    //           style: OutlinedButton.styleFrom(
                    //               alignment: Alignment.centerRight,
                    //               padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    //               backgroundColor:
                    //                   Color.fromRGBO(29, 39, 73, 1),
                    //               shape: const StadiumBorder(),
                    //               side: BorderSide(color: Colors.transparent)),
                    //           onPressed: () {
                    //             // Navigator.push(
                    //             //   context,
                    //             //   MaterialPageRoute(
                    //             //       builder: (context) =>
                    //             //           const SignUpScreen()),
                    //             // );
                    //           },
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    //   // ),
                    //   // color: Colors.orange,
                    // ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                      height: 65,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(29, 39, 73, 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Container(
                            height: 65,
                            width: MediaQuery.of(context).size.width - 130,
                            child: OutlinedButton(
                              child: Text("Challenge Bank"),
                              style: OutlinedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 17),
                                padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
                                alignment: Alignment.centerLeft,
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromRGBO(29, 39, 73, 1),
                                shape: const StadiumBorder(),
                                side: BorderSide(color: Colors.transparent),
                              ),
                              onPressed: () {
                                networkAPICall().httpGetRequest(
                                    'api/v1/practice/challange/question',
                                        (status, responseData) {
                                      if (status) {
                                        final mainJson = json.decode(responseData);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  practiceTest(response:mainJson['response'])),
                                        );
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
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => ChallengeBank()),
                                // );
                              },
                            ),
                          ),
                          Container(
                            child: OutlinedButton(
                              child:
                                  Image.asset("images/logo/challenge bank.png"),
                              style: OutlinedButton.styleFrom(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  backgroundColor:
                                      Color.fromRGBO(29, 39, 73, 1),
                                  shape: const StadiumBorder(),
                                  side: BorderSide(color: Colors.transparent)),
                              onPressed: () {

                              },
                            ),
                          )
                        ],
                      ),
                      // ),
                      // color: Colors.orange,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // --------------------------------------
        ));
  }
}
