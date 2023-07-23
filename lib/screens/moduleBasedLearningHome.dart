import 'package:CanLi/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CanLi/screens/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:CanLi/service/api.dart';
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:CanLi/screens/moduleBasedLearningQuestions.dart';
import 'package:url_launcher/url_launcher.dart';
class moduleBasedLearningHome extends StatelessWidget {
  const moduleBasedLearningHome({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('https://www.ontario.ca/document/official-mto-drivers-handbook/getting-your-drivers-licence');
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }
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
              int value = 0;
              networkAPICall().httpGetRequest(
                  'api/v1/practice/fetch/progress',
                      (status, responseData) {
                    if (status) {
                      final mainJson = json.decode(responseData);
                      value = mainJson['response'];
                    } else {
                      value = 0;
                    }
                  });
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(value: value,)));
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
                child: Text("Modules",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(29, 39, 73, 1),
                    )),
              ),
              // -------------------------------------
              //  Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height + 151,
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                          color: Color.fromRGBO(29, 39, 73, 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Container(
                            height: 95,
                            width: MediaQuery.of(context).size.width - 130,
                            child: OutlinedButton(
                              child: Text("About Licensing System"),
                              style: OutlinedButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                                padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
                                alignment: Alignment.centerLeft,
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromRGBO(29, 39, 73, 1),
                                shape: const StadiumBorder(),
                                side: BorderSide(color: Colors.transparent),
                              ),
                              onPressed: _launchUrl
                            ),
                          ),
                          Container(
                            child: OutlinedButton(
                              child: Image.asset("images/logo/about.png"),
                              style: OutlinedButton.styleFrom(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.fromLTRB(8, 6, 0, 5),
                                  backgroundColor:
                                      Color.fromRGBO(29, 39, 73, 1),
                                  shape: const StadiumBorder(),
                                  side: BorderSide(color: Colors.transparent)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          moduleBasedLearningHome()),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      // ),
                      // color: Colors.orange,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 40, 20, 10),
                      height: 95,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(29, 39, 73, 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Container(
                            height: 95,
                            width: MediaQuery.of(context).size.width - 130,
                            child: OutlinedButton(
                              child: Text("Road Signs"),
                              style: OutlinedButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                                padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
                                alignment: Alignment.centerLeft,
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromRGBO(29, 39, 73, 1),
                                shape: const StadiumBorder(),
                                side: BorderSide(color: Colors.transparent),
                              ),
                              onPressed: () {
                                networkAPICall().httpGetRequest(
                                    'api/v1/practice/module/question?question_type=sign',
                                    (status, responseData) {
                                  if (status) {
                                    final mainJson = json.decode(responseData);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              moduleBasedLearningScreens(
                                                  response:
                                                      mainJson['response'])),
                                    );
                                  } else {
                                    print(responseData);
                                    var responseJson =
                                        json.decode(responseData);
                                    print(responseJson['message']);

                                    Fluttertoast.showToast(
                                        msg: responseJson['error'],
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                });
                              },
                            ),
                          ),
                          Container(
                            child: OutlinedButton(
                              child: Image.asset("images/logo/roadS.png"),
                              style: OutlinedButton.styleFrom(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.fromLTRB(8, 6, 0, 5),
                                  backgroundColor:
                                      Color.fromRGBO(29, 39, 73, 1),
                                  shape: const StadiumBorder(),
                                  side: BorderSide(color: Colors.transparent)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          moduleBasedLearningHome()),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      // ),
                      // color: Colors.orange,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 40, 20, 10),
                      height: 95,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(29, 39, 73, 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Container(
                            height: 110,
                            width: MediaQuery.of(context).size.width - 130,
                            child: OutlinedButton(
                              child: Text("Fines,Limits & Points"),
                              style: OutlinedButton.styleFrom(
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                                padding: EdgeInsets.fromLTRB(30, 0, 10, 0),
                                alignment: Alignment.centerLeft,
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromRGBO(29, 39, 73, 1),
                                shape: const StadiumBorder(),
                                side: BorderSide(color: Colors.transparent),
                              ),
                              onPressed: () {
                                networkAPICall().httpGetRequest(
                                    'api/v1/practice/module/question?question_type=rule',
                                    (status, responseData) {
                                  if (status) {
                                    final mainJson = json.decode(responseData);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              moduleBasedLearningScreens(
                                                  response:
                                                      mainJson['response'])),
                                    );
                                  } else {
                                    print(responseData);
                                    var responseJson =
                                        json.decode(responseData);
                                    print(responseJson['message']);

                                    Fluttertoast.showToast(
                                        msg: responseJson['error'],
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                });
                              },
                            ),
                          ),
                          Container(
                            child: OutlinedButton(
                              child: Image.asset("images/logo/Fin.png"),
                              style: OutlinedButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.fromLTRB(8, 6, 0, 5),
                                  backgroundColor:
                                      Color.fromRGBO(29, 39, 73, 1),
                                  shape: const StadiumBorder(),
                                  side: BorderSide(color: Colors.transparent)),
                              onPressed: () {
                                int value = 0;
                                networkAPICall().httpGetRequest(
                                    'api/v1/practice/fetch/progress',
                                        (status, responseData) {
                                      if (status) {
                                        final mainJson = json.decode(responseData);
                                        value = mainJson['response'];
                                      } else {
                                        value = 0;
                                      }
                                    });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen(value: value,)),
                                );
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
