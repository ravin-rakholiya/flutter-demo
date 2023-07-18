import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CanLi/screens/verifyOtp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:CanLi/service/api.dart';
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final birthdateController = TextEditingController();
  final locationController = TextEditingController();
  final testDateController = TextEditingController();
  addStringToSF(
      String email,
      int otp_verification_id,
      String full_name,
      String location_city,
      String test_date,
      String dob,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(email);
    print(otp_verification_id);
    prefs.setString('email', email);
    prefs.setString('full_name', full_name);
    prefs.setString('location_city', location_city);
    prefs.setString('test_date', test_date);
    prefs.setString('dob', dob);
    prefs.setInt('otp_verification_id', otp_verification_id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width / 1.6,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Image.asset(
                                          "images/logo/CanLi_logo.png")),
                                  Column(children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(top: 70.0),
                                        child: Text("CANLI",
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
                            height: MediaQuery.of(context).size.width + 220,
                            decoration: BoxDecoration(
                                color: Color(0xFFF2F2FA),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100))),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(top: 30.0),
                                        child: Text("SIGN UP",
                                            overflow: TextOverflow.visible,
                                            maxLines: 1,
                                            // softWrap: false,
                                            style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 40))),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 260, 0),
                                        child: Text("Name",
                                            overflow: TextOverflow.visible,
                                            maxLines: 1,
                                            // softWrap: false,
                                            style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20))),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 5, 40, 0),
                                      child: TextField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.indigo)),
                                          filled: true,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10.0,
                                              left: 10.0,
                                              right: 10.0),
                                          labelText: "EX. NICK JONES",
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 160, 0),
                                        child: Text("EMAIL ADDRESS",
                                            overflow: TextOverflow.visible,
                                            maxLines: 1,
                                            // softWrap: false,
                                            style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20))),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 5, 40, 0),
                                      child: TextField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.indigo)),
                                          filled: true,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10.0,
                                              left: 10.0,
                                              right: 10.0),
                                          labelText: "EXAMPLE@GMAIL.COM",
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 200, 0),
                                        child: Text("BIRTH-DATE",
                                            overflow: TextOverflow.visible,
                                            maxLines: 1,
                                            // softWrap: false,
                                            style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20))),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 5, 40, 0),
                                      child: TextField(
                                        controller: birthdateController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.indigo)),
                                          filled: true,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10.0,
                                              left: 10.0,
                                              right: 10.0),
                                          labelText: "YYYY-MM-DD",
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 200, 0),
                                        child: Text("LOCATION",
                                            overflow: TextOverflow.visible,
                                            maxLines: 1,
                                            // softWrap: false,
                                            style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20))),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 5, 40, 0),
                                      child: TextField(
                                        controller: locationController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.indigo)),
                                          filled: true,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10.0,
                                              left: 10.0,
                                              right: 10.0),
                                          labelText: "ONTARIO",
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 200, 0),
                                        child: Text("TEST DATE",
                                            overflow: TextOverflow.visible,
                                            maxLines: 1,
                                            // softWrap: false,
                                            style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20))),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 5, 40, 0),
                                      child: TextField(
                                        controller: testDateController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.indigo)),
                                          filled: true,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 10.0,
                                              left: 10.0,
                                              right: 10.0),
                                          labelText: "YYYY-MM-DD",
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 35, 40, 0),
                                        child: Container(
                                          child: TextButton(
                                            //True if this widget will be selected as the initial focus when no other node in its scope is currently focused.
                                            autofocus: true,
                                            //Called when the button is tapped or otherwise activated.
                                            onPressed: () {
                                              print("200------------");
                                              String name =
                                                  nameController.text.trim();
                                              String email =
                                                  emailController.text.trim();
                                              String birthDate =
                                                  birthdateController.text
                                                      .trim();
                                              String location =
                                                  locationController.text
                                                      .trim();
                                              String testDate = testDateController.text.trim();
                                              // String email,
                                              //     int otp_verification_id,
                                              // String full_name,
                                              // String location_city,
                                              // String test_date,
                                              // String dob,

                                              final postData = {
                                                'full_name': name,
                                                'email': email,
                                                'birthDate': birthDate,
                                                'location': location,
                                                'test_date': testDate
                                              };
                                              networkAPICall().httpPostRequest(
                                                  'api/v1/user/generate_otp',
                                                  postData,
                                                  (status, responseData) {
                                                print(status);
                                                print(status);
                                                if (status) {
                                                  final mainJson =
                                                      json.decode(responseData);
                                                  print(mainJson);
                                                  String message =
                                                      mainJson['message'];
                                                  int otp_verification_id =
                                                      mainJson[
                                                          'otp_verification_id'];
                                                  print(message);
                                                  print(otp_verification_id);
                                                  addStringToSF(email, otp_verification_id, name, location, testDate, birthDate);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OTPVerification(),
                                                    ),
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
                                            //Customizes this button's appearance
                                            style: TextButton.styleFrom(
                                                primary: Colors.white,
                                                backgroundColor: Colors.indigo,
                                                onSurface: Colors.indigo,
                                                shadowColor: Colors.indigo,
                                                elevation: 5,
                                                side: const BorderSide(
                                                    color: Colors.indigo,
                                                    width: 1),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28.0),
                                                ),
                                                textStyle: const TextStyle(
                                                  color: Colors.indigo,
                                                  fontSize: 20,
                                                  fontStyle: FontStyle.normal,
                                                )),

                                            //Typically the button's label.
                                            child: const Text(
                                              "    SIGN UP    ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
