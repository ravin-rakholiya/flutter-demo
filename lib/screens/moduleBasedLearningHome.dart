import 'package:CanLi/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CanLi/screens/signup.dart';
import 'package:CanLi/screens/PT_list.dart';

class moduleBasedLearningHome extends StatelessWidget {
  const moduleBasedLearningHome({super.key});
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
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text("Modules",style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900,color: Color.fromRGBO(29, 39, 73,1),)),
            ),
            // -------------------------------------
            //  Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height+151,
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              decoration: BoxDecoration(
                // color: Colors.purple,
                  color: Color(0xFFF2F2FA),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100))),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 105, 20, 10),
                  height: 95,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(children: [
                    Container(
                      height: 95,
                      width: MediaQuery.of(context).size.width - 130,
                      child: OutlinedButton(
                        child: Text("About Licensing System"),
                        style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500) ,padding: EdgeInsets.fromLTRB(30,0, 10, 0) ,alignment: Alignment.centerLeft ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => moduleBasedLearningHome() ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: OutlinedButton(
                        child: Image.asset("images/logo/about.png"),
                        style: OutlinedButton.styleFrom(alignment: Alignment.centerRight, padding: EdgeInsets.fromLTRB(8,6,0, 5) ,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(), side: BorderSide(color: Colors.transparent)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => moduleBasedLearningHome() ),
                          );
                        },
                      ),
                    )
                  ],),
                  // ),
                  // color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 40, 20, 10),
                  height: 95,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(children: [
                    Container(
                      height: 95,
                      width: MediaQuery.of(context).size.width - 130,
                      child: OutlinedButton(
                        child: Text("Road Signs"),
                        style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500) ,padding: EdgeInsets.fromLTRB(30,0, 10, 0) ,alignment: Alignment.centerLeft ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => moduleBasedLearningHome() ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: OutlinedButton(
                        child: Image.asset("images/logo/roadS.png"),
                        style: OutlinedButton.styleFrom(alignment: Alignment.centerRight, padding: EdgeInsets.fromLTRB(8,6,0, 5) ,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(), side: BorderSide(color: Colors.transparent)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => moduleBasedLearningHome() ),
                          );
                        },
                      ),
                    )
                  ],),
                  // ),
                  // color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 40, 20, 10),
                  height: 95,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(29, 39, 73,1),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(children: [
                    Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width - 130,
                      child: OutlinedButton(
                        child: Text("Fines,Limits & Points"),
                        style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500) ,padding: EdgeInsets.fromLTRB(30,0, 10, 0) ,alignment: Alignment.centerLeft ,foregroundColor: Colors.white,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder(),side: BorderSide(color: Colors.transparent),),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => moduleBasedLearningHome() ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: OutlinedButton(
                        child: Image.asset("images/logo/Fin.png"),
                        style: OutlinedButton.styleFrom(alignment: Alignment.centerLeft, padding: EdgeInsets.fromLTRB(8,6,0, 5) ,backgroundColor: Color.fromRGBO(29, 39, 73,1),shape: const StadiumBorder() ,side: BorderSide(color: Colors.transparent)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen() ),
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