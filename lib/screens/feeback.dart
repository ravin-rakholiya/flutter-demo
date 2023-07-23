import 'package:flutter/material.dart';
import 'package:CanLi/screens/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:CanLi/service/api.dart';
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';

class FeedbackScreen extends StatefulWidget {
  FeedbackScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FeedbackScreenState();
  }
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1.6,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.asset("images/logo/CanLi_logo.png")),
                    const Column(children: [
                      const Padding(
                          padding: EdgeInsets.only(top: 80.0),
                          child: const Text("CANLI",
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40))),
                      Text("DL For Everyone",
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ])
                  ]),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              // height: 537.5,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width + 145,
              decoration: const BoxDecoration(
                  color: Color(0xFFF2F2FA),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100))),
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(children: [
                      const Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text("Feedback",
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              // softWrap: false,
                              style: TextStyle(
                                  color: Color.fromRGBO(29, 39, 73,1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40))),


                      const Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 200, 0),
                          child: Text("FEEDBACK",
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              // softWrap: false,
                              style: TextStyle(
                                  color: Color.fromRGBO(29, 39, 73,1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))),
                       Padding(
                        padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
                        child: TextField(
                          controller: feedbackController,
                          keyboardType: TextInputType.multiline,
                          maxLength: 350,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Color.fromRGBO(29, 39, 73,1))),
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                bottom: 20.0, left: 10.0, right: 10.0),
                            labelText: "ENTER FEEDBACK",
                          ),
                          maxLines: 14,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: Container(
                            child: TextButton(
                              //True if this widget will be selected as the initial focus when no other node in its scope is currently focused.
                              autofocus: true,
                              //Called when the button is tapped or otherwise activated.
                              onPressed: () {
                                var postData = {
                                  'feedback': feedbackController.text,

                                };
                                networkAPICall().httpPostRequest(
                                    'api/v1/user/add/feedback', postData,
                                        (status, responseData) {
                                      print("***************");
                                      print(status);
                                      if (status) {
                                        final mainJson = json.decode(responseData);
                                        Fluttertoast.showToast(
                                            msg: mainJson['response'],
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                               ProfileScreen()),
                                        );
                                      } else {
                                        var responseJson =
                                        json.decode(responseData);
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
                              //Customizes this button's appearance
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Color.fromRGBO(29, 39, 73,1),
                                  onSurface: Color.fromRGBO(29, 39, 73,1),
                                  shadowColor: Color.fromRGBO(29, 39, 73,1),
                                  elevation: 5,
                                  side: const BorderSide(
                                      color: Color.fromRGBO(29, 39, 73,1), width: 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  textStyle: const TextStyle(
                                    color: Color.fromRGBO(29, 39, 73,1),
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                  )),

                              //Typically the button's label.
                              child: const Text(
                                "    SUBMIT    ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                            ),
                          ))
                    ]),
                  ]),
            ),
          ],
        ),
      ]),
    );
  }
}
