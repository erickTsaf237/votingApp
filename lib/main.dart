import 'package:apprend/Election.dart';
import 'package:apprend/composants/Entete.dart';
import 'package:apprend/composants/SearchEntry.dart';
import 'package:apprend/pages/monDrawer.dart';
import 'package:flutter/gestures.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'ElectionsPages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Widget titleSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    "Pizza facile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text(
                  "Par David Silvera",
                  style: TextStyle(color: Colors.grey[500], fontSize: 15),
                )
              ],
            ),
          ),
          Icon(Icons.favorite, color: Colors.red),
          Text("55")
        ],
      ));
  Widget maBottomNavBar = /* bottomNavigationBar:*/ BottomAppBar(
    shape: const CircularNotchedRectangle(),
    color: Colors.black,
    child: Container(
      height: 50.0,
    ),
  );
  Widget monFlottingButton = FloatingActionButton(
    onPressed: () {},
    tooltip: 'Increment Cuunter',
    child: Icon(Icons.add),
  );
  Widget monDrawerHeader = const DrawerHeader(
    decoration: BoxDecoration(
      color: Colors.blueGrey,
    ),
    child: Text(
      "Hello World",
      style: TextStyle(color: Colors.grey, fontSize: 25),
    ),
  );

  Widget monBotomNavigationBar = BottomNavigationBar(
      currentIndex: 0,
      fixedColor: Colors.green,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: "Profile",
        )
      ]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(

              appBar: AppBar(

                title: Row(
                  children: [
                    Expanded(child: Container(
                      child: const Text("You-Vote !"),
                    )),
                    SearchEntry()
                  ],
                ),
                // drawer: monDrawer
                bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_ferry)),
                    Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
              ),
              drawer: MonDrawer(),
              body: TabBarView(
                children: [
                  getElectionList(),
                  ListView(
                    children: [
                      for (var i = 0; i < 7; i++)
                        const ListTile(
                          leading: Icon(Icons.how_to_vote),
                          title: Text("My Election"),
                        )
                    ],
                  ),
                  ListView(
                    children: [
                      for (var i = 0; i < 3; i++)
                        const ListTile(
                          leading: Icon(Icons.how_to_vote),
                          title: Text("My Election"),
                        ),
                      // getELectionListe().then((value) => null),
                    ],
                  ),
                ],
              )
          ),
        ));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w100,
            color: color,
          ),
        )
      ],
    );
  }
}

