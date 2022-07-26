// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class bgpage extends StatefulWidget {
  const bgpage({Key? key}) : super(key: key);

  @override
  _bgpageState createState() => _bgpageState();
}

class _bgpageState extends State<bgpage> {
  late String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/LOGIN123.gif"),
          ),
        ),
      ),
    );
  }
}
