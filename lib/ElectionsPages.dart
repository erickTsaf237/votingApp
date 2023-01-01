import 'package:apprend/Election.dart';
import 'package:apprend/composants/Createur.dart';
import 'package:apprend/dto/ElectionDTO.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ElectionPage extends StatelessWidget {
  late ElectionDTO _electionDTO;

  ElectionPage(ElectionDTO electionDTO, {super.key}) {
    _electionDTO = electionDTO;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _electionDTO.libele,
            softWrap: true,
          ),
        ),
        body: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(""
                  // _electionDTO.libele,
                  // style: TextStyle(color: Colors.white, fontSize: 21),
                  ),
              accountEmail: Text(
                  "",
                  // _electionDTO.createdAd.toString(),
                  // style: TextStyle(color: Colors.white, fontSize: 16)
                ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  // colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.luminosity),
                  image: NetworkImage(_electionDTO.image!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Createur(_electionDTO.utilisateur),
          ],
        ));
  }
}
/*


appBar: AppBar(
// Here we take the value from the MyHomePage object that was created by
// the App.build method, and use it to set our appbar title.
title: Text("Mes recette"),
bottom: const TabBar(tabs: [
Tab(icon: Icon(Icons.directions_car),),
Tab(icon: Icon(Icons.directions_transit),),
Tab(icon: Icon(Icons.directions_bike),),
Tab(icon: Icon(Icons.directions_boat),),
Tab(icon: Icon(Icons.directions_ferry),),
Tab(icon: Icon(Icons.directions_run),),
Tab(icon: Icon(Icons.directions_walk),),
],
isScrollable: true,
),
),
body:TabBarView(
children: [
Column(children: [
titleSection,
]),
ListView( children:  [
Image.asset(
'images/16.png',
width: 600,
height: 240,
fit: BoxFit.cover,
),
buttonSection,
description,
]),
Column(children: [
titleSection,
]),
Column(children: [

]),
Column(children: [
titleSection,
]),
Column(children: [

]),
Column(children: [
titleSection,
]),
],
),
bottomNavigationBar: monBotomNavigationBar,
floatingActionButton: monFlottingButton,
floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
drawer: monDrawer,
// This trailing comma makes auto-formatting nicer for build methods.
)*/

Future<List<dynamic>> getELectionListe() async {
  var url = Uri.parse('http://localhost:3021/elections');
  var rep = await http.get(url);
  var data = jsonDecode(rep.body);
  if (rep.statusCode == 200) {}
  return data;
}

getElectionList() {
  return FutureBuilder(
    future: getELectionListe(),
    builder: (context, reponse) {
      if (reponse.hasData) {
        print(reponse.data);
        return ListView(
          children: [
            for (var l in reponse.data!) Election(l),
            // Text(l['libele']),
          ],
        );

        // ListView.builder(itemCount: snapshot.data?.length, itemBuilder:(context, index){
        //   return Text(snapshot.data![index]['libele']);
        // },);
      } else if (reponse.hasError) {
        return Text("Error ");
      }
      return CircularProgressIndicator();
    },
  );
}
