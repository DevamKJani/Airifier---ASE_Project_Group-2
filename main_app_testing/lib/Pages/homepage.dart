// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ase_project1/Model/user_model.dart';
import 'package:ase_project1/Pages/Test.dart';
import 'package:ase_project1/Pages/community.dart';
import 'package:ase_project1/calendar_widget.dart';
import 'package:ase_project1/my_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  var currentPage = DrawerSections.UserProfile;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 153, 0, 1),
        title: Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            "AIRIFIER",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: height - 590,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("meter.png"),
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Test()));
                },
                child: Column(
                  children: [
                    Ink.image(
                      image: AssetImage('test.png'),
                      height: height * .2,
                      width: width * 0.5,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Take a Test",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage('testtaken.png'),
                        height: height * .2,
                        width: width * 0.4,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Previous Test",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Ink.image(
                      image: AssetImage('community.png'),
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Community",
                      style: TextStyle(fontSize: 32, color: Colors.black),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                  ],
                )),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                    accountName: Text("Hello,${loggedInUser.name}"),
                    accountEmail: Text("${loggedInUser.email}")),
                MyListDrawer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyHeaderList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(),
    );
  }

  Widget MyListDrawer() {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          menuItem(1, "User Profile", Icons.perm_identity,
              currentPage == DrawerSections.UserProfile ? true : false),
          menuItem(2, "Notifications", Icons.notifications,
              currentPage == DrawerSections.Notifications ? true : false),
          menuItem(3, "Settings", Icons.settings,
              currentPage == DrawerSections.Settings ? true : false),
          menuItem(4, "Logout", Icons.logout,
              currentPage == DrawerSections.Logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              if (id == 1) {
                currentPage = DrawerSections.UserProfile;
              } else if (id == 2) {
                currentPage = DrawerSections.Notifications;
              } else if (id == 3) {
                currentPage = DrawerSections.Settings;
              } else if (id == 4) {
                currentPage = DrawerSections.Logout;
              }
            });
          },
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                    child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                )),
                Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

enum DrawerSections {
  UserProfile,
  Notifications,
  Settings,
  Logout,
}
