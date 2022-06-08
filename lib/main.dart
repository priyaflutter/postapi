import 'package:flutter/material.dart';
import 'package:postapi/dataview.dart';
import 'package:postapi/login.dart';
import 'package:postapi/profirst.dart';
import 'package:postapi/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: pro1(),
    debugShowCheckedModeBanner: false,
  ));
}

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  static SharedPreferences? pref;

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool login = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    login1();
  }

  login1() async {
    splash.pref = await SharedPreferences.getInstance();

    setState(() {

      login=splash.pref!.getBool("login")??false;

    });

    Future.delayed(Duration(seconds: 10)).then((value) {
      if (login) {
        print("loginnnnnnnnnnnnnn");
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return postdiff();
          },
        ));
      } else {
        print("notttttttttttt");

        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return register();
          },
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double tnaviheight = MediaQuery.of(context).padding.bottom;
    double tappbar = kToolbarHeight;

    double bodyheight = theight - tappbar - statusbarheight - tnaviheight;

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          height: bodyheight * 0.50,
          width: twidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/register.gif"), fit: BoxFit.fill)),
        ),
      )),
    );
  }
}
