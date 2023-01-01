


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build  
    return AppBar(
        title: const Text("You-Vote !"),
        // drawer: monDrawer
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ));
  }

  
}