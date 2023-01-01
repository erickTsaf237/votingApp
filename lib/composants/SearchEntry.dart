import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchEntry extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        showSearch(
            context: context, delegate: MySearchDelegate());
      },
    );
  }

}

class MySearchDelegate extends SearchDelegate {
  final List<String> _items = ['apple', 'banana', 'orange', 'mango'];

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
        : _items.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index]),
          );
        });
  }
}
