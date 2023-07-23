import 'package:CanLi/screens/edit_profile.dart';
import 'package:CanLi/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CanLi/screens/PracticeTest.dart';
// import 'package:CanLi/screens/progressBar.dart';

class pt_list extends StatelessWidget {
  const pt_list({super.key});
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
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => const practiceTest()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text("Practice Test's",style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900,color: Color.fromRGBO(29, 39, 73,1),)),
            ),
            // -------------------------------------
            //  Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height+151,
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              decoration: BoxDecoration(
                // color: Colors.purple,
                  color: Color(0xFFF2F2FA),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100))),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 70, 20, 10),
                  height: 95,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1),
                      borderRadius: BorderRadius.circular(25)),
                  child: OutlinedButton(
                    child: Text("Practice Test 1"),
                    style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w900) ,padding: EdgeInsets.fromLTRB(0,0, 10, 0) ,alignment: Alignment.center ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen() ),
                      );
                    },
                  ),
                  // ),
                  // color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  height: 95,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1),
                      borderRadius: BorderRadius.circular(25)),
                  child: OutlinedButton(
                    child: Text("Practice Test 2"),
                    style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w900) ,padding: EdgeInsets.fromLTRB(0,0, 10, 0) ,alignment: Alignment.center ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen() ),
                      );
                    },
                  ),
                  // ),
                  // color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  height: 95,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1),
                      borderRadius: BorderRadius.circular(25)),
                  child: OutlinedButton(
                    child: Text("Practice Test 3"),
                    style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w900) ,padding: EdgeInsets.fromLTRB(0,0, 10, 0) ,alignment: Alignment.center ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen() ),
                      );
                    },
                  ),
                  // ),
                  // color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  height: 95,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1),
                      borderRadius: BorderRadius.circular(25)),
                  child: OutlinedButton(
                    child: Text("Practice Test 4"),
                    style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w900) ,padding: EdgeInsets.fromLTRB(0,0, 10, 0) ,alignment: Alignment.center ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen() ),
                      );
                    },
                  ),
                  // ),
                  // color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  height: 95,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1),
                      borderRadius: BorderRadius.circular(25)),
                  child: OutlinedButton(
                    child: Text("Practice Test 5"),
                    style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w900) ,padding: EdgeInsets.fromLTRB(0,0, 10, 0) ,alignment: Alignment.center ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen() ),
                      );
                    },
                  ),
                  // ),
                  // color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  height: 95,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1),
                      borderRadius: BorderRadius.circular(25)),
                  child: OutlinedButton(
                    child: Text("Practice Test 6"),
                    style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w900) ,padding: EdgeInsets.fromLTRB(0,0, 10, 0) ,alignment: Alignment.center ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen() ),
                      );
                    },
                  ),
                  // ),
                  // color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  height: 95,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1),
                      borderRadius: BorderRadius.circular(25)),
                  child: OutlinedButton(
                    child: Text("Practice Test 7"),
                    style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.w900) ,padding: EdgeInsets.fromLTRB(0,0, 10, 0) ,alignment: Alignment.center ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen() ),
                      );
                    },
                  ),
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