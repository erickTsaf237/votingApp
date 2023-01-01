

import 'package:apprend/pages/connexion.dart';
import 'package:flutter/material.dart';

import '../ElectionsPages.dart';
import '../main.dart';

class MonDrawer extends StatelessWidget {
  creerDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              "AppMaking.co",
              style: TextStyle(color: Colors.white, fontSize: 21),
            ),
            accountEmail: Text("sundar@appmaking.co",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage("http://localhost/images/6.jpg"),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                // colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.luminosity),
                image: NetworkImage(
                  "http://localhost/images/3.jpg",
                ),
                fit: BoxFit.fill,
              ),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/women/74.jpg"),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/47.jpg"),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => MyApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("About"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.grid_3x3_outlined),
            title: Text("Products"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text("Setting"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => const Connexion()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text("Connection"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => const Connexion()));
            },
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return creerDrawer(context);
  }
}