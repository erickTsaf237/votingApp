import 'dart:convert';

import 'package:apprend/ElectionsPages.dart';
import 'package:apprend/dto/ElectionDTO.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Election extends StatelessWidget {
  late ElectionDTO _electionDTO;

  Election(l) {
    _electionDTO = ElectionDTO.utlisateur(
        l['id'],
        l['id_createur'],
        l['libele'],
        l['description'],
        DateTime.parse(l['createdAt']),
        DateTime.parse(l['updatedAt']),
        l['image'],
        l['utilisateur']);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ElectionPage(_electionDTO)));
      },
      leading: _electionDTO.image!=null
          ? CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  _electionDTO.image!),

            )
          : Icon(Icons.how_to_vote),
      title: Text(_electionDTO.libele),
    );
  }

  getELectionListe() async {
    var url = Uri.parse('http://localhost:3021/elections');
    var rep = await http.get(url);
    if (rep.statusCode == 200) {
      var data = jsonDecode(rep.body);
      return Row(
        children: [Text(data)],
      );
    }
  }
}
