import 'package:apprend/dto/UtilisateurDTO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/UtilisateurPage.dart';

class Createur extends StatelessWidget {
  late UtilisateurDTO _createur;
  late List<UtilisateurDTO> admins = [];

  Createur(this._createur) {
    admins.add(_createur);
    admins.add(UtilisateurDTO());
    admins.add(UtilisateurDTO());
    admins.add(UtilisateurDTO());
    admins.add(UtilisateurDTO());
    admins.add(UtilisateurDTO());
    admins.add(UtilisateurDTO());
    admins.add(UtilisateurDTO());
    admins.add(UtilisateurDTO());
    admins.add(UtilisateurDTO());
    admins.add(UtilisateurDTO());
    admins.add(UtilisateurDTO());
    admins.add(UtilisateurDTO());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Card(
            child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.cyan,
              child: const Text(
                "Creator",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            makeUtilisateurItem(context, _createur)
          ],
        )),
        Card(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.cyan,
                child: const Text(
                  "Adminstrators list",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              for (var admin in admins)
                if (admins.indexOf(admin) < 5)
                  makeUtilisateurItem(context, admin),
              if (admins.length >= 5) SearchEntry(admins),
            ],
          ),
        )
      ],
    );
  }

  static makeUtilisateurItem(BuildContext context, UtilisateurDTO createur) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(createur.image!),
        ),
        title: Row(
          children: [
            Expanded(
                child: Container(
              // padding: const EdgeInsets.only(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "${createur.nom} ${createur.prenom}",
                      style: const TextStyle(fontSize: 23),
                    ),
                  ),
                  Text(
                    createur.email,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ))
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UtilisateurPage(createur)));
        });
  }
}

class SearchEntry extends StatelessWidget {
  late List<UtilisateurDTO> _items;

  SearchEntry(this._items);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 15),
        alignment: Alignment.center,
        color: Colors.grey,
        child: Text(
          "see all aminstrators (${_items.length})",
          style: TextStyle(fontSize: 16),
        ),
      ),
      onTap: () {
        showSearch(context: context, delegate: MyUserSearchDelegate(_items));
      },
    );
  }
}

class MyUserSearchDelegate extends SearchDelegate {
  late List<UtilisateurDTO> _items;

  MyUserSearchDelegate(this._items);

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: Text('No Result found'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestions = query.isEmpty
        ? _items
        : _items.where((p) => "${p.nom} ${p.nom}".startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return Createur.makeUtilisateurItem(context, suggestions[index]);
        });
  }
}
