
import 'package:apprend/dto/UtilisateurDTO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UtilisateurPage extends StatelessWidget{
  late UtilisateurDTO utilisateur;

  UtilisateurPage(this.utilisateur, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${utilisateur.nom} ${utilisateur.prenom}"),
      ),
    );
  }



}