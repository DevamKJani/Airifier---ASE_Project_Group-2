// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ase_project1/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  var currentPage = DrawerSections.UserProfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AIRIFIER",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(195, 9, 104, 12),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Ink.image(
                    image: AssetImage('test.png'),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Take a Test",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Ink.image(
                    image: AssetImage('test.png'),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Take a Test",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Ink.image(
                    image: AssetImage('test.png'),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Take a Test",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Ink.image(
                    image: AssetImage('test.png'),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Take a Test",
                    style: TextStyle(fontSize: 32, color: Colors.black),
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
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
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
