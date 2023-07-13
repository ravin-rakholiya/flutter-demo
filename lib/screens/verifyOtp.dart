import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CanLi/screens/homeScreen.dart';
import 'package:CanLi/screens/profile.dart';
import 'package:CanLi/screens/feeback.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({super.key});

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
                          child: Text("OTP VERIFICATION",
                              overflow: TextOverflow.visible,
                              maxLines: 1,
                              // softWrap: false,
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30))),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 200, 0),
                          child: Text("Enter Code",
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
                          keyboardType: TextInputType.number,
                          maxLength: 6,
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
                            labelText: "###-###",
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const FeedbackScreen()),
                                );
                              },
                              //Customizes this button's appearance
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor:
                                  Colors.indigo,
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
