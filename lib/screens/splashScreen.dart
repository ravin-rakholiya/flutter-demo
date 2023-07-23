import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CanLi/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:CanLi/screens/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Future<Null> checkIsLogin() async {
    String? _token = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString("token");
    if (_token != "" && _token != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    } else {
      //replace it with the login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => new LoginScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 4), () {
      checkIsLogin();
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'images/logo/splashscreen.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
