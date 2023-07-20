import 'package:CanLi/screens/edit_profile.dart';
import 'package:CanLi/screens/homeScreen.dart';
import 'package:CanLi/screens/practiceTest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CanLi/screens/signup.dart';
import 'package:CanLi/screens/progressBar.dart';

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
                height: 10,
              ),
              Center(
                child: Text("Practice Test Level",
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
                height: MediaQuery.of(context).size.height + 400,
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
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25)),
                      child: OutlinedButton(
                        child: Text("EASY"),
                        style: OutlinedButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w900),
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          alignment: Alignment.center,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          shape: const StadiumBorder(),
                          side: BorderSide(color: Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => practiceTest()),
                          );
                        },
                      ),
                      // ),
                      // color: Colors.orange,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 30, 20, 10),
                      height: 95,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        // color: Color.fromRGBO(29, 39, 73,1),
                          color: Colors.yellow.shade500,
                          borderRadius: BorderRadius.circular(25)),
                      child: OutlinedButton(
                        child: Text("MEDIUM"),
                        style: OutlinedButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w900),
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          alignment: Alignment.center,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.yellow.shade500,
                          shape: const StadiumBorder(),
                          side: BorderSide(color: Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => practiceTest()),
                          );
                        },
                      ),
                      // ),
                      // color: Colors.orange,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 30, 20, 10),
                      height: 95,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(25)),
                      child: OutlinedButton(
                        child: Text("HARD"),
                        style: OutlinedButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w900),
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          alignment: Alignment.center,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.redAccent,
                          shape: const StadiumBorder(),
                          side: BorderSide(color: Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => practiceTest()),
                          );
                        },
                      ),
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
