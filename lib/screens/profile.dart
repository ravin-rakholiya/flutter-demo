import 'package:CanLi/screens/edit_profile.dart';
import 'package:CanLi/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CanLi/screens/signup.dart';
import 'package:CanLi/screens/progressBar.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:CanLi/service/api.dart';
import 'dart:convert' show json;
import 'package:url_launcher/url_launcher.dart';
import 'package:CanLi/screens/feeback.dart';
import 'dart:convert' show json;
import 'package:shared_preferences/shared_preferences.dart';

final Uri _url =
Uri.parse('https://canli-team.github.io/Canli/privacypolicyterms.html');

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
   String? full_name;
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("24-------");
    full_name =  await prefs.getString('full_name');

  }

  // getStringValuesSF();
  @override
  Widget build(BuildContext context) {
    // while(full_name == null){
    //   getStringValuesSF();
    // }
    getStringValuesSF();

    print("33--------");
    print(full_name);
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
              color: Color.fromRGBO(29, 39, 73,1),
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
                  builder: (BuildContext context) =>  HomeScreen(value: value,)));
            },
          ),
        ),
        body: SingleChildScrollView(
          // color: Colors.white,
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 180,
              child: ListView(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Color.fromRGBO(29, 39, 73,1)),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "images/logo/profile.png"))),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: Color.fromRGBO(29, 39, 73,1),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      full_name.toString(),
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,),
                    ),
                  )
                ],
              ),

            ),
            // -------------------------------------
            //  Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height+151,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(
                  color: Color(0xFFF2F2FA),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100))),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 85, 20, 10),
                  height: 65,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1), borderRadius: BorderRadius.circular(25)),
                  child: Row(children: [
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width - 130,
                      child: OutlinedButton(
                        child: Text("Edit Profile"),
                        style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 20) ,padding: EdgeInsets.fromLTRB(30,0, 10, 0) ,alignment: Alignment.centerLeft ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => editProfile() ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: OutlinedButton(
                        child: Image.asset("images/logo/bookmark question.png"),
                        style: OutlinedButton.styleFrom(alignment: Alignment.centerRight, padding: EdgeInsets.fromLTRB(5,0, 0, 0) ,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(), side: BorderSide(color: Colors.transparent)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => editProfile() ),
                          );
                        },
                      ),
                    )
                  ],),
                  // ),
                  // color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  height: 65,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1), borderRadius: BorderRadius.circular(25)),
                  child: Row(children: [
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width - 130,
                      child: OutlinedButton(
                        child: Text("Contact"),
                        style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 20) ,padding: EdgeInsets.fromLTRB(30,0, 10, 0) ,alignment: Alignment.centerLeft ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                        onPressed: () {
                          String email = Uri.encodeComponent("ravinkumarrakh@gmail.com");
                          String subject = Uri.encodeComponent("Contact Us");
                          String body = Uri.encodeComponent("Hi! I'm CanLi user");
                          Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
                          launchUrl(mail);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => ProgressIndicatorApp() ),
                          // );
                        },
                      ),
                    ),
                    Container(
                      child: OutlinedButton(
                        child: Image.asset("images/logo/practise test.png"),
                        style: OutlinedButton.styleFrom(alignment: Alignment.centerRight, padding: EdgeInsets.fromLTRB(5,0, 0, 0) ,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(), side: BorderSide(color: Colors.transparent)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProgressIndicatorApp() ),
                          );
                        },
                      ),
                    )
                  ],),
                  // ),
                  // color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  height: 65,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1), borderRadius: BorderRadius.circular(25)),
                  child: Row(children: [
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width - 130,
                      child: OutlinedButton(
                        child: Text("Reset all progress"),
                        style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 20) ,padding: EdgeInsets.fromLTRB(30,0, 10, 0) ,alignment: Alignment.centerLeft ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                        onPressed: () {
                          String value;
                          networkAPICall().httpGetRequest(
                              'api/v1/practice/reset/progress',
                                  (status, responseData) {
                                if (status) {
                                  final mainJson = json.decode(responseData);
                                  value =  mainJson['response'];
                                  print(mainJson);
                                } else {
                                  value = "0";
                                }
                              });
                          Fluttertoast.showToast(
                              msg: "Reset Successfully.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen(value: 0) ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: OutlinedButton(
                        child: Image.asset("images/logo/module based.png"),
                        style: OutlinedButton.styleFrom(alignment: Alignment.centerRight, padding: EdgeInsets.fromLTRB(8,6,0, 5) ,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(), side: BorderSide(color: Colors.transparent)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProgressIndicatorApp() ),
                          );
                        },
                      ),
                    )
                  ],),
                  // ),
                  // color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  height: 65,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1),
                      // color: Colors.purple,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(children: [
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width - 130,
                      child: OutlinedButton(
                        child: Text("Privacy & Terms"),
                        style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 20) ,padding: EdgeInsets.fromLTRB(30,0, 10, 0) ,alignment: Alignment.centerLeft ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                        onPressed: () {
                          _launchUrl();

                        },
                      ),
                    ),
                    Container(
                      child: OutlinedButton(
                        child: Image.asset("images/logo/bookmarked notes.png"),
                        style: OutlinedButton.styleFrom(alignment: Alignment.centerRight, padding: EdgeInsets.fromLTRB(5,0, 0, 0) ,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(), side: BorderSide(color: Colors.transparent)),
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
                            MaterialPageRoute(builder: (context) => HomeScreen(value: value,) ),
                          );
                        },
                      ),
                    )
                  ],),
                  // ),
                  // color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  height: 65,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1), borderRadius: BorderRadius.circular(25)),
                  child: Row(children: [
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width - 130,
                      child: OutlinedButton(
                        child: Text("Give Feedback"),
                        style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 20) ,padding: EdgeInsets.fromLTRB(30,0, 10, 0) ,alignment: Alignment.centerLeft ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FeedbackScreen() ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: OutlinedButton(
                        child: Image.asset("images/logo/challenge bank.png"),
                        style: OutlinedButton.styleFrom(alignment: Alignment.centerRight,padding: EdgeInsets.fromLTRB(0,5, 0, 5) ,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(), side: BorderSide(color: Colors.transparent)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen() ),
                          );
                        },
                      ),
                    )
                  ],),
                  // ),
                  // color: Colors.orange,
                ),
              ],),
            ),
          ],
          ),
          // --------------------------------------
        ));
  }
}


// import 'package:CanLi/screens/edit_profile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:CanLi/screens/homeScreen.dart';
// import 'package:CanLi/screens/profile.dart';
//
// class FeedbackScreen extends StatelessWidget {
//   const FeedbackScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       child: Column(children: [
//         Stack(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.width / 1.6,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//               ),
//               child: Row(
//                 // crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Center(child: Image.asset("images/logo/CanLi_logo.png")),
//                     Column(children: [
//                       Padding(
//                           padding: const EdgeInsets.only(top: 80.0),
//                           child: Text("CANLI",
//                               overflow: TextOverflow.visible,
//                               maxLines: 1,
//                               softWrap: false,
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 40))),
//                       Text("DL For Everyone",
//                           overflow: TextOverflow.visible,
//                           maxLines: 1,
//                           softWrap: false,
//                           style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14)),
//                     ])
//                   ]),
//             ),
//           ],
//         ),
//         Column(
//           children: [
//             Container(
//               // height: 537.5,
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.width + 145,
//               decoration: BoxDecoration(
//                   color: Color(0xFFF2F2FA),
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(100),
//                       topRight: Radius.circular(100))),
//               child: Column(
//                 // crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Column(children: [
//                       Padding(
//                           padding: const EdgeInsets.only(top: 30.0),
//                           child: Text("Feedback",
//                               overflow: TextOverflow.visible,
//                               maxLines: 1,
//                               // softWrap: false,
//                               style: TextStyle(
//                                   color: Color.fromRGBO(29, 39, 73,1),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 40))),
//                       Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 0, 260, 0),
//                           child: Text("Name",
//                               overflow: TextOverflow.visible,
//                               maxLines: 1,
//                               // softWrap: false,
//                               style: TextStyle(
//                                   color: Color.fromRGBO(29, 39, 73,1),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20))),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
//                         child: TextField(
//                           keyboardType: TextInputType.name,
//                           decoration: InputDecoration(
//                             fillColor: Colors.white,
//                             border: InputBorder.none,
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius:
//                                 BorderRadius.all(Radius.circular(15.0)),
//                                 borderSide: BorderSide(color: Color.fromRGBO(29, 39, 73,1))),
//                             filled: true,
//                             contentPadding: EdgeInsets.only(
//                                 bottom: 10.0, left: 10.0, right: 10.0),
//                             labelText: "EX. NICK JONES",
//                           ),
//                         ),
//                       ),
//                       Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 10, 160, 0),
//                           child: Text("EMAIL ADDRESS",
//                               overflow: TextOverflow.visible,
//                               maxLines: 1,
//                               // softWrap: false,
//                               style: TextStyle(
//                                   color: Color.fromRGBO(29, 39, 73,1),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20))),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
//                         child: TextField(
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                             fillColor: Colors.white,
//                             border: InputBorder.none,
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius:
//                                 BorderRadius.all(Radius.circular(15.0)),
//                                 borderSide: BorderSide(color: Color.fromRGBO(29, 39, 73,1))),
//                             filled: true,
//                             contentPadding: EdgeInsets.only(
//                                 bottom: 10.0, left: 10.0, right: 10.0),
//                             labelText: "EXAMPLE@GMAIL.COM",
//                           ),
//                         ),
//                       ),
//                       Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 10, 200, 0),
//                           child: Text("FEEDBACK",
//                               overflow: TextOverflow.visible,
//                               maxLines: 1,
//                               // softWrap: false,
//                               style: TextStyle(
//                                   color: Color.fromRGBO(29, 39, 73,1),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20))),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
//                         child: TextField(
//                           keyboardType: TextInputType.multiline,
//                           maxLength: 225,
//                           decoration: InputDecoration(
//                             fillColor: Colors.white,
//                             border: InputBorder.none,
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius:
//                                 BorderRadius.all(Radius.circular(15.0)),
//                                 borderSide: BorderSide(color: Color.fromRGBO(29, 39, 73,1))),
//                             filled: true,
//                             contentPadding: EdgeInsets.only(
//                                 bottom: 20.0, left: 10.0, right: 10.0),
//                             labelText: "ENTER FEEDBACK",
//
//                           ),
//                           maxLines: 6,
//                         ),
//                       ),
//
//                       Padding(
//                           padding: const EdgeInsets.fromLTRB(40, 35, 40, 0),
//                           child: Container(
//                             child: TextButton(
//                               //True if this widget will be selected as the initial focus when no other node in its scope is currently focused.
//                               autofocus: true,
//                               //Called when the button is tapped or otherwise activated.
//                               onPressed: () {
//                                 // ignore: avoid_print
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                        editProfile()),
//                                 );
//                               },
//                               //Customizes this button's appearance
//                               style: TextButton.styleFrom(
//                                   primary: Colors.white,
//                                   backgroundColor:
//                                   Color.fromRGBO(29, 39, 73,1),
//                                   onSurface: Color.fromRGBO(29, 39, 73,1),
//                                   shadowColor: Color.fromRGBO(29, 39, 73,1),
//                                   elevation: 5,
//                                   side: const BorderSide(
//                                       color: Color.fromRGBO(29, 39, 73,1), width: 1),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(28.0),
//                                   ),
//                                   textStyle: const TextStyle(
//                                     color: Color.fromRGBO(29, 39, 73,1),
//                                     fontSize: 20,
//                                     fontStyle: FontStyle.normal,
//                                   )),
//
//                               //Typically the button's label.
//                               child: const Text("    SUBMIT    ",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 22),),
//                             ),
//                           ))
//                     ]),
//                   ]),
//             ),
//           ],
//         ),
//       ]),
//     );
//   }
// }