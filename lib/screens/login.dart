import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CanLi/screens/verifyOtp.dart';
import 'package:CanLi/screens/signup.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:CanLi/service/api.dart';
import 'dart:convert' show json;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Uri _url =
    Uri.parse('https://canli-team.github.io/Canli/privacypolicyterms.html');

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  addStringToSF(
      String email,
      int otp_verification_id,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("21-------");
    print(email);
    print(otp_verification_id);
    prefs.setString('email', email);
    prefs.setInt('otp_verification_id', otp_verification_id);
  }
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Material(
      color: Colors.white,
      child: Column(children: [
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
                    Center(child: Image.asset("images/logo/CanLi_logo.png")),
                    Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: Text("CANLI",
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40))),
                      Text("DL For Everyone",
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                              color: Colors.indigo,
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
              decoration: BoxDecoration(
                  color: Color(0xFFF2F2FA),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100))),
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          "SIGN IN",
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          // softWrap: false,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 50, 200, 0),
                          child: Text("Email Address",
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              // softWrap: false,
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22))),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.indigo)),
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                bottom: 10.0, left: 10.0, right: 10.0),
                            labelText: "example@gmail.com",
                            labelStyle: TextStyle(
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 35, 40, 0),
                          child: Container(
                            child: TextButton(
                              //True if this widget will be selected as the initial focus when no other node in its scope is currently focused.
                              autofocus: true,
                              //Called when the button is tapped or otherwise activated.
                              onPressed: () {
                                // ignore: avoid_print
                                String email = emailController.text.trim();
                                final postData = {
                                  'email': email,
                                };
                                networkAPICall().httpPostRequest(
                                    'api/v1/user/generate_otp', postData,
                                    (status, responseData) {
                                  if (status) {
                                    final mainJson = json.decode(responseData);
                                    print(mainJson);
                                    String message = mainJson['message'];
                                    int otp_verification_id =
                                        mainJson['otp_verification_id'];
                                    print(message);
                                    print(otp_verification_id);
                                    addStringToSF(
                                      email,
                                      otp_verification_id,

                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OTPVerification(),
                                      ),
                                    );
                                  } else {
                                    print(responseData);
                                    var responseJson =
                                        json.decode(responseData);
                                    print(responseJson['error']);

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
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor:
                                      Colors.indigo.withOpacity(0.71),
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
                              child: const Text("    Sign In    ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(55, 20, 10, 10),
                        child: Container(
                            child: Row(
                          children: [
                            Container(
                              height: 1.0,
                              width: 70.0,
                              color: Colors.black,
                            ),
                            Text("    OR CONTINUE WITH    ",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            Container(
                              height: 1.0,
                              width: 70.0,
                              color: Colors.black,
                            ),
                          ],
                        )),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
                          child: Container(
                            child: TextButton(
                              //True if this widget will be selected as the initial focus when no other node in its scope is currently focused.
                              autofocus: true,
                              //Called when the button is tapped or otherwise activated.
                              onPressed: () {
                                // ignore: avoid_print
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           OTPVerification()),
                                );
                              },
                              //Customizes this button's appearance
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.indigo,
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
                                  Image.asset(
                                      "images/logo/google_logo.png"), // <-- Use 'Image.asset(...)' here
                                  SizedBox(width: 2),
                                  Text(' Continue with Google     '),
                                ],
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          "DON'T HAVE AN ACCOUNT?",
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          // softWrap: false,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 24, 15, 15),
                        child: Container(
                            child: Row(
                          children: [
                            Text("@2023 CANLI",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            Spacer(),
                            // Text("",
                            //     style: TextStyle(
                            //         color: Colors.blueGrey,
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 12)),

                            InkWell(
                              onTap: _launchUrl,
                              child: Text(
                                "Privacy & Terms",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ]),
                  ]),
            ),
          ],
        ),
      ]),
    );
  }
}
