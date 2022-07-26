// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:ase_project1/Pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Splash> {
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return new Timer(duration, loginRoute);
  }

  loginRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const loginpage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Shimmer(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFf1a00a),
                    Colors.grey.shade400,
                    Color(0xFF0cc0df),
                  ],
                ),
                child: Text(
                  "Airifier",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      textBaseline: TextBaseline.alphabetic,
                      fontSize: 100),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
